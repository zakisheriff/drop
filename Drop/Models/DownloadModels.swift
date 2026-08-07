import Foundation

/// A link that yt-dlp confirmed it can handle.
struct VideoLink: Equatable, Sendable, Identifiable {
    var id: String { url.absoluteString }
    let url: URL
    let title: String
    let extractor: String
    /// Video heights the link offers, tallest first.
    let heights: [Int]
}

/// Measured state of an in-flight transfer.
struct DownloadProgress: Equatable, Sendable {
    var completedBytes: Int64?
    var totalBytes: Int64?
    var bytesPerSecond: Double?
    var secondsRemaining: Double?

    var fraction: Double? {
        guard let completedBytes, let totalBytes, totalBytes > 0 else { return nil }
        return min(1, Double(completedBytes) / Double(totalBytes))
    }
}

/// The stages a download passes through, in order.
enum DownloadPhase: Equatable, Sendable {
    case preparing
    case downloading
    case merging
}

/// Events emitted by `DownloadService` while yt-dlp runs.
enum DownloadEvent: Equatable, Sendable {
    case phase(DownloadPhase)
    case progress(DownloadProgress)
    case finished(URL?)
}

/// The single source of truth for what the status line shows.
enum AppStatus: Equatable, Sendable {
    case ready
    case waitingForLink
    case checkingLink
    case linkReady
    case preparing
    case downloading(DownloadProgress)
    case merging
    case finished(URL?)
    case failed(DropError)

    var text: String {
        switch self {
        case .ready: "Ready"
        case .waitingForLink: "Waiting for copied link…"
        case .checkingLink: "Checking link…"
        case .linkReady: "Ready to download"
        case .preparing: "Extracting…"
        case .downloading: "Downloading…"
        case .merging: "Merging…"
        case .finished: "Finished"
        case .failed(.cancelled): "Cancelled"
        case .failed: "Failed"
        }
    }

    var isBusy: Bool {
        switch self {
        case .preparing, .downloading, .merging: true
        default: false
        }
    }

    var progress: DownloadProgress? {
        if case .downloading(let progress) = self { return progress }
        return nil
    }
}
