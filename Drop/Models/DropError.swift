import Foundation

/// Every failure Drop can surface to the user, phrased for a native alert.
enum DropError: LocalizedError, Equatable, Sendable {
    case missingYTDLP
    case missingFFmpeg
    case toolLaunchFailed(tool: String, reason: String)
    case noInternet
    case unsupportedLink
    case permissionDenied
    case diskFull
    case invalidDestination(String)
    case cancelled
    case downloadFailed(String)

    var errorDescription: String? {
        switch self {
        case .missingYTDLP:
            "yt-dlp Isn’t Installed"
        case .missingFFmpeg:
            "FFmpeg Isn’t Installed"
        case .toolLaunchFailed(let tool, _):
            "Couldn’t Start \(tool)"
        case .noInternet:
            "No Internet Connection"
        case .unsupportedLink:
            "Unsupported Link"
        case .permissionDenied:
            "Permission Denied"
        case .diskFull:
            "Not Enough Disk Space"
        case .invalidDestination:
            "Download Folder Unavailable"
        case .cancelled:
            "Download Cancelled"
        case .downloadFailed:
            "Download Failed"
        }
    }

    var recoverySuggestion: String? {
        switch self {
        case .missingYTDLP:
            "Drop uses yt-dlp to download videos. Install it with Homebrew, then try again."
        case .missingFFmpeg:
            "Drop uses FFmpeg to merge video and audio into an MP4. Install it with Homebrew, then try again."
        case .toolLaunchFailed(_, let reason):
            reason
        case .noInternet:
            "Drop couldn’t reach the server. Check your network connection and try again."
        case .unsupportedLink:
            "This link doesn’t point to a video that yt-dlp can download."
        case .permissionDenied:
            "Drop isn’t allowed to write to the selected folder. Choose a different download folder."
        case .diskFull:
            "Free up space on your disk, or choose a folder on another volume."
        case .invalidDestination(let path):
            "Drop couldn’t create or write to “\(path)”. Choose a different download folder."
        case .cancelled:
            "The download was stopped before it finished."
        case .downloadFailed(let detail):
            detail
        }
    }

    /// Shell command that resolves the failure, when one exists.
    var installCommand: String? {
        switch self {
        case .missingYTDLP: "brew install yt-dlp"
        case .missingFFmpeg: "brew install ffmpeg"
        default: nil
        }
    }

    /// Interprets yt-dlp's diagnostics, falling back to its own last message.
    static func fromToolOutput(_ output: String) -> DropError {
        let text = output.lowercased()
        if text.contains("no space left") {
            return .diskFull
        }
        if text.contains("permission denied") || text.contains("read-only file system") {
            return .permissionDenied
        }
        // A returned HTTP status proves the network is fine, so those are
        // checked before the connection failures below.
        if !text.contains("http error"),
           text.contains("failed to resolve")
            || text.contains("temporary failure in name resolution")
            || text.contains("nodename nor servname")
            || text.contains("network is unreachable")
            || text.contains("connection refused")
            || text.contains("getaddrinfo") {
            return .noInternet
        }
        if text.contains("unsupported url") || text.contains("is not a valid url") {
            return .unsupportedLink
        }
        if text.contains("ffmpeg") && text.contains("not installed") {
            return .missingFFmpeg
        }
        return .downloadFailed(lastMeaningfulLine(in: output) ?? "yt-dlp stopped unexpectedly.")
    }

    private static func lastMeaningfulLine(in output: String) -> String? {
        output
            .split(whereSeparator: \.isNewline)
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .last { !$0.isEmpty && !$0.hasPrefix("WARNING:") }
            .map { line in
                line.hasPrefix("ERROR: ") ? String(line.dropFirst("ERROR: ".count)) : line
            }
    }
}
