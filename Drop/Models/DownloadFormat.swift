import Foundation

/// What the user wants out of a link. Options are offered only when yt-dlp
/// reports that the link actually provides them.
enum DownloadFormat: Hashable, Identifiable, Sendable {
    /// The tallest stream the link has, named with its real height so the menu
    /// never makes the user guess what "best" means.
    case highest(height: Int?)
    case upTo(height: Int)
    case audioM4A
    case audioMP3

    static let best = DownloadFormat.highest(height: nil)

    var id: Self { self }

    var name: String {
        switch self {
        case .highest(let height): height.map { "Highest (\($0)p)" } ?? "Highest Quality"
        case .upTo(let height): "\(height)p"
        case .audioM4A: "Audio Only (M4A)"
        case .audioMP3: "Audio Only (MP3)"
        }
    }

    var isAudioOnly: Bool {
        switch self {
        case .audioM4A, .audioMP3: true
        default: false
        }
    }

    /// yt-dlp selector and container arguments for this choice.
    var arguments: [String] {
        switch self {
        case .highest:
            ["--format", "bv*+ba/b", "--merge-output-format", "mp4"]
        case .upTo(let height):
            [
                "--format",
                "bv*[height<=\(height)]+ba/b[height<=\(height)]/bv*+ba/b",
                "--merge-output-format", "mp4"
            ]
        case .audioM4A:
            ["--format", "ba/b", "--extract-audio", "--audio-format", "m4a"]
        case .audioMP3:
            ["--format", "ba/b", "--extract-audio", "--audio-format", "mp3"]
        }
    }

    /// Familiar resolutions, tallest first. Real streams rarely land exactly on
    /// these — a cinematic video might top out at 2026 tall — so the menu offers
    /// ceilings the user recognises and lets yt-dlp pick what fits under each.
    private static let ladder = [4320, 2160, 1440, 1080, 720, 480, 360, 240]

    /// The menu Drop shows for a link, limited by what the link really offers.
    /// Rungs equal to the tallest stream are dropped — they'd duplicate it.
    static func options(forHeights heights: [Int]) -> [DownloadFormat] {
        guard let tallest = heights.max() else { return [.best, .audioM4A, .audioMP3] }
        let rungs = ladder.filter { $0 < tallest }.map { DownloadFormat.upTo(height: $0) }
        return [.highest(height: tallest)] + rungs + [.audioM4A, .audioMP3]
    }
}
