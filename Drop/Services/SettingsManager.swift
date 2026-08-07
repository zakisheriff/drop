import Observation
import SwiftUI

/// Observable settings, persisted on change and applied to the services that
/// depend on them.
@MainActor
@Observable
final class SettingsManager {
    private let store: any PreferenceStoring
    private let files: any FileServicing
    private let loginItems: any LoginItemManaging

    var downloadFolder: URL {
        didSet { store.downloadFolder = downloadFolder }
    }

    var notifiesOnCopy: Bool {
        didSet { store.notifiesOnCopy = notifiesOnCopy }
    }

    var revealsInFinder: Bool {
        didSet { store.revealsInFinder = revealsInFinder }
    }

    var playsCompletionSound: Bool {
        didSet { store.playsCompletionSound = playsCompletionSound }
    }

    var monitorsClipboard: Bool {
        didSet {
            store.monitorsClipboard = monitorsClipboard
            onClipboardMonitoringChanged?(monitorsClipboard)
        }
    }

    var shortcutEnabled: Bool {
        didSet {
            store.shortcutEnabled = shortcutEnabled
            onShortcutChanged?(activeShortcut)
        }
    }

    var shortcut: GlobalShortcut {
        didSet {
            store.shortcut = shortcut
            onShortcutChanged?(activeShortcut)
        }
    }

    var launchesAtLogin: Bool {
        didSet { applyLoginItem() }
    }

    /// Set when macOS refuses a login item change, shown beneath the toggle.
    private(set) var loginItemMessage: String?

    var onClipboardMonitoringChanged: ((Bool) -> Void)?
    var onShortcutChanged: ((GlobalShortcut?) -> Void)?

    var activeShortcut: GlobalShortcut? {
        shortcutEnabled ? shortcut : nil
    }

    init(
        store: any PreferenceStoring,
        files: any FileServicing,
        loginItems: any LoginItemManaging
    ) {
        self.store = store
        self.files = files
        self.loginItems = loginItems
        self.downloadFolder = store.downloadFolder ?? files.defaultDownloadFolder
        self.notifiesOnCopy = store.notifiesOnCopy
        self.revealsInFinder = store.revealsInFinder
        self.playsCompletionSound = store.playsCompletionSound
        self.monitorsClipboard = store.monitorsClipboard
        self.shortcutEnabled = store.shortcutEnabled
        self.shortcut = store.shortcut ?? .controlD
        self.launchesAtLogin = loginItems.isEnabled
    }

    /// Validates a folder before adopting it, so a bad choice fails loudly here
    /// rather than mid-download.
    func setDownloadFolder(_ folder: URL) throws {
        try files.prepare(folder)
        downloadFolder = folder
    }

    private func applyLoginItem() {
        do {
            try loginItems.setEnabled(launchesAtLogin)
            loginItemMessage = nil
        } catch {
            loginItemMessage = "macOS didn’t allow this change. Open Login Items in System Settings to add Drop manually."
            launchesAtLogin = loginItems.isEnabled
        }
    }
}
