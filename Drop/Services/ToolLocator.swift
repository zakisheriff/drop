import Foundation

struct ToolPaths: Sendable, Equatable {
    var ytDLP: URL
    var ffmpeg: URL
}

protocol ToolLocating: Sendable {
    func ytDLP() throws -> URL
    func ffmpeg() throws -> URL
    func resolveAll() throws -> ToolPaths
}

/// Finds the Homebrew-installed command line tools Drop depends on.
struct ToolLocator: ToolLocating {
    /// Homebrew on Apple silicon and Intel, plus the usual manual install spots.
    static let searchPaths: [String] = [
        "/opt/homebrew/bin",
        "/usr/local/bin",
        "/opt/local/bin",
        "/usr/bin",
        NSHomeDirectory() + "/.local/bin"
    ]

    func ytDLP() throws -> URL {
        guard let url = locate("yt-dlp") else { throw DropError.missingYTDLP }
        return url
    }

    func ffmpeg() throws -> URL {
        guard let url = locate("ffmpeg") else { throw DropError.missingFFmpeg }
        return url
    }

    func resolveAll() throws -> ToolPaths {
        ToolPaths(ytDLP: try ytDLP(), ffmpeg: try ffmpeg())
    }

    private func locate(_ name: String) -> URL? {
        for directory in Self.searchPaths {
            let candidate = URL(filePath: directory).appending(path: name)
            if FileManager.default.isExecutableFile(atPath: candidate.path(percentEncoded: false)) {
                return candidate
            }
        }
        return nil
    }
}
