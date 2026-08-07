import AppKit
import OSLog
import Observation
import SwiftUI

/// Everything the main window shows and does. Views hold no logic of their own.
@MainActor
@Observable
final class DropViewModel {
    private(set) var status: AppStatus = .ready
    private(set) var link: VideoLink?
    private(set) var inspectedURL: URL?
    private(set) var lastDownloadedFile: URL?
    private(set) var formatOptions: [DownloadFormat] = [.best]

    var selectedFormat: DownloadFormat = .best
    var alert: DropAlert?
    var isSettingsPresented = false
    var isFolderImporterPresented = false

    let settings: SettingsManager

    private let clipboard: ClipboardMonitor
    private let validator: any LinkValidating
    private let downloads: any DownloadServicing
    private let files: any FileServicing
    let notifications: NotificationManager
    private let shortcuts: ShortcutManager
    private let tools: any ToolLocating

    private let logger = Logger(subsystem: "com.atomoriginals.Drop", category: "links")

    private var hasStarted = false
    private var toolsAvailable = false
    private var validationTask: Task<Void, Never>?
    private var downloadTask: Task<Void, Never>?
    private var resetTask: Task<Void, Never>?

    init(
        settings: SettingsManager,
        clipboard: ClipboardMonitor,
        validator: any LinkValidating,
        downloads: any DownloadServicing,
        files: any FileServicing,
        notifications: NotificationManager,
        shortcuts: ShortcutManager,
        tools: any ToolLocating
    ) {
        self.settings = settings
        self.clipboard = clipboard
        self.validator = validator
        self.downloads = downloads
        self.files = files
        self.notifications = notifications
        self.shortcuts = shortcuts
        self.tools = tools
    }

    // MARK: - Presentation

    var urlText: String {
        link?.url.absoluteString ?? inspectedURL?.absoluteString ?? ""
    }

    var subtitle: String? {
        guard let link, !status.isBusy else { return nil }
        return link.title
    }

    var canDownload: Bool {
        link != nil && !status.isBusy
    }

    var downloadFolderName: String {
        settings.downloadFolder.lastPathComponent
    }

    // MARK: - Lifecycle

    func onAppear() {
        guard !hasStarted else { return }
        hasStarted = true

        verifyTools()
        notifications.configure()
        notifications.onResponse = { [weak self] response in
            switch response {
            case .downloadRequested(let url): self?.download(url)
            case .formatChoiceRequested(let url): self?.presentForFormatChoice(url)
            case .revealRequested(let file): self?.files.revealInFinder(file)
            }
        }

        shortcuts.onTrigger = { [weak self] in
            self?.downloadFromShortcut()
        }
        shortcuts.apply(settings.activeShortcut)

        settings.onShortcutChanged = { [weak self] shortcut in
            self?.shortcuts.apply(shortcut)
        }
        settings.onClipboardMonitoringChanged = { [weak self] isOn in
            self?.setClipboardMonitoring(isOn)
        }

        clipboard.onLinkCopied = { [weak self] url in
            self?.inspect(url, announce: true)
        }
        setClipboardMonitoring(settings.monitorsClipboard)

        Task { [notifications] in await notifications.requestAuthorization() }
    }

    // MARK: - Clipboard

    private func setClipboardMonitoring(_ isOn: Bool) {
        isOn ? clipboard.start() : clipboard.stop()
        guard toolsAvailable, !status.isBusy else { return }

        if isOn, link == nil, let url = clipboard.currentLink() {
            inspect(url, announce: false)
        } else {
            status = restingStatus
        }
    }

    /// Validates a copied link with yt-dlp and updates the window accordingly.
    private func inspect(_ url: URL, announce: Bool) {
        if !toolsAvailable { verifyTools(announcing: false) }
        guard toolsAvailable, !status.isBusy, url != link?.url else { return }
        logger.debug("inspecting \(url.absoluteString, privacy: .public)")

        validationTask?.cancel()
        resetTask?.cancel()
        link = nil
        inspectedURL = url
        status = .checkingLink

        validationTask = Task { [weak self] in
            guard let self else { return }
            let result = await self.validate(url)
            guard !Task.isCancelled, self.inspectedURL == url else { return }

            switch result {
            case .success(let video):
                self.adopt(video)
                if announce { self.announce(video) }
            case .failure:
                self.link = nil
                self.inspectedURL = nil
                self.status = self.restingStatus
            }
        }
    }

    /// Tells the user a link is ready. A notification banner is the polite
    /// version, but Focus modes silence those — the Dock badge and a single
    /// bounce get through regardless.
    private func announce(_ video: VideoLink) {
        guard settings.notifiesOnCopy else { return }
        notifications.offerDownload(for: video)

        guard !NSApplication.shared.isActive else { return }
        NSApp.dockTile.badgeLabel = "1"
        NSApp.dockTile.display()
        NSApp.requestUserAttention(.informationalRequest)
    }

    /// Clears the Dock badge once the user has actually looked at Drop.
    func windowDidBecomeActive() {
        NSApp.dockTile.badgeLabel = nil
    }

    /// Takes on a validated link and rebuilds the quality menu around it.
    private func adopt(_ video: VideoLink) {
        link = video
        formatOptions = DownloadFormat.options(forHeights: video.heights)
        // A previous audio-only choice carries over; a resolution can't, since
        // the new link may not offer it.
        if !formatOptions.contains(selectedFormat) {
            selectedFormat = formatOptions.first ?? .best
        }
        status = .linkReady
    }

    private func validate(_ url: URL) async -> Result<VideoLink, DropError> {
        do {
            return .success(try await validator.validate(url))
        } catch let error as DropError {
            return .failure(error)
        } catch {
            return .failure(.downloadFailed(error.localizedDescription))
        }
    }

    // MARK: - Downloading

    /// Downloads straight to the chosen destination — no questions asked.
    func download() {
        guard let link, !status.isBusy else { return }
        start(link, destination: settings.downloadFolder)
    }

    /// Validates first, then downloads — used by notifications and the hot key.
    private func download(_ url: URL) {
        guard !status.isBusy else { return }
        if let link, link.url == url {
            download()
            return
        }

        resetTask?.cancel()
        validationTask?.cancel()
        inspectedURL = url
        status = .checkingLink

        validationTask = Task { [weak self] in
            guard let self else { return }
            switch await self.validate(url) {
            case .success(let video):
                guard !Task.isCancelled else { return }
                self.adopt(video)
                self.download()
            case .failure(let error):
                self.inspectedURL = nil
                self.status = .failed(error)
                self.present(error)
            }
        }
    }

    /// Brings Drop forward with the link loaded so the user can pick a format.
    private func presentForFormatChoice(_ url: URL) {
        NSApplication.shared.activate(ignoringOtherApps: true)
        if link?.url != url { inspect(url, announce: false) }
    }

    func downloadFromShortcut() {
        NSApplication.shared.activate(ignoringOtherApps: true)
        if canDownload {
            download()
        } else if let url = clipboard.currentLink() {
            download(url)
        }
    }

    private func start(_ link: VideoLink, destination: URL) {
        do {
            try files.prepare(destination)
        } catch let error as DropError {
            status = .failed(error)
            present(error)
            return
        } catch {
            let wrapped = DropError.invalidDestination(destination.path(percentEncoded: false))
            status = .failed(wrapped)
            present(wrapped)
            return
        }

        resetTask?.cancel()
        downloadTask?.cancel()
        status = .preparing
        lastDownloadedFile = nil

        let request = DownloadRequest(
            link: link,
            destination: destination,
            format: selectedFormat
        )
        downloadTask = Task { [weak self] in
            guard let self else { return }
            await self.consume(downloads.download(request))
        }
    }

    private func consume(_ events: AsyncThrowingStream<DownloadEvent, any Error>) async {
        do {
            for try await event in events {
                switch event {
                case .phase(.preparing):
                    status = .preparing
                case .phase(.downloading):
                    status = .downloading(DownloadProgress())
                case .phase(.merging):
                    status = .merging
                case .progress(let progress):
                    status = .downloading(progress)
                case .finished(let file):
                    finish(file)
                }
            }
            try Task.checkCancellation()
        } catch is CancellationError {
            status = .failed(.cancelled)
            scheduleReset()
        } catch let error as DropError {
            status = .failed(error)
            present(error)
            notifications.announceFailure(error)
        } catch {
            let wrapped = DropError.downloadFailed(error.localizedDescription)
            status = .failed(wrapped)
            present(wrapped)
        }
    }

    private func finish(_ file: URL?) {
        lastDownloadedFile = file
        status = .finished(file)

        if settings.revealsInFinder, let file {
            files.revealInFinder(file)
        }
        if settings.playsCompletionSound {
            NSSound(named: "Glass")?.play()
        }
        if !NSApplication.shared.isActive {
            notifications.announceCompletion(title: link?.title ?? "Video", file: file)
        }
        scheduleReset()
    }

    func cancel() {
        downloadTask?.cancel()
        downloadTask = nil
    }

    /// Returns the window to a resting state a few seconds after a download ends.
    private func scheduleReset() {
        resetTask?.cancel()
        resetTask = Task { [weak self] in
            try? await Task.sleep(for: .seconds(4))
            guard !Task.isCancelled, let self, !self.status.isBusy else { return }
            self.status = self.restingStatus
        }
    }

    /// What the status line shows when nothing is happening.
    private var restingStatus: AppStatus {
        if link != nil { return .linkReady }
        return clipboard.isRunning ? .waitingForLink : .ready
    }

    // MARK: - Folder

    func chooseFolder() {
        isFolderImporterPresented = true
    }

    func folderSelected(_ result: Result<URL, any Error>) {
        guard case .success(let folder) = result else { return }
        do {
            try settings.setDownloadFolder(folder)
        } catch let error as DropError {
            present(error)
        } catch {
            present(.invalidDestination(folder.path(percentEncoded: false)))
        }
    }

    func revealLastDownload() {
        guard let lastDownloadedFile else { return }
        files.revealInFinder(lastDownloadedFile)
    }

    // MARK: - Dependencies

    /// Re-runs whenever a link appears, so installing yt-dlp mid-session works
    /// without relaunching Drop.
    private func verifyTools(announcing: Bool = true) {
        do {
            _ = try tools.resolveAll()
            toolsAvailable = true
            if case .failed = status { status = restingStatus }
        } catch {
            toolsAvailable = false
            let dropError = error as? DropError ?? .missingYTDLP
            status = .failed(dropError)
            if announcing { present(dropError) }
        }
    }

    private func present(_ error: DropError) {
        alert = DropAlert(error: error)
    }
}

/// A native alert, plus the Homebrew command that fixes it when relevant.
struct DropAlert: Identifiable, Sendable {
    let id = UUID()
    let title: String
    let message: String
    let installCommand: String?

    init(error: DropError) {
        title = error.errorDescription ?? "Something Went Wrong"
        message = error.recoverySuggestion ?? ""
        installCommand = error.installCommand
    }
}
