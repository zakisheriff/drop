import AppKit
import Foundation

/// Watches the general pasteboard for links, without busy-waiting.
@MainActor
final class ClipboardMonitor {
    private let pasteboard: NSPasteboard
    private let interval: Duration
    private var lastChangeCount: Int
    private var task: Task<Void, Never>?

    /// Called on the main actor whenever a new http(s) link is copied.
    var onLinkCopied: ((URL) -> Void)?

    init(pasteboard: NSPasteboard = .general, interval: Duration = .milliseconds(700)) {
        self.pasteboard = pasteboard
        self.interval = interval
        self.lastChangeCount = pasteboard.changeCount
    }

    var isRunning: Bool { task != nil }

    func start() {
        guard task == nil else { return }
        lastChangeCount = pasteboard.changeCount
        task = Task { [weak self] in
            while !Task.isCancelled {
                guard let self else { return }
                try? await Task.sleep(for: self.interval)
                guard !Task.isCancelled else { return }
                self.checkForChanges()
            }
        }
    }

    func stop() {
        task?.cancel()
        task = nil
    }

    /// The link currently on the pasteboard, if there is one.
    func currentLink() -> URL? {
        Self.firstLink(in: pasteboard.string(forType: .string))
    }

    private func checkForChanges() {
        let changeCount = pasteboard.changeCount
        guard changeCount != lastChangeCount else { return }
        lastChangeCount = changeCount
        guard let url = currentLink() else { return }
        onLinkCopied?(url)
    }

    /// Accepts a bare link or one pasted alongside other text.
    static func firstLink(in text: String?) -> URL? {
        guard let text, !text.isEmpty, text.utf16.count < 4096 else { return nil }

        for token in text.split(whereSeparator: { $0.isWhitespace || $0.isNewline }) {
            let candidate = token.trimmingCharacters(in: CharacterSet(charactersIn: "<>\"'()[],."))
            let lowercased = candidate.lowercased()
            guard lowercased.hasPrefix("http://") || lowercased.hasPrefix("https://") else { continue }
            guard let url = URL(string: candidate), let host = url.host(), host.contains(".") else { continue }
            return url
        }
        return nil
    }
}
