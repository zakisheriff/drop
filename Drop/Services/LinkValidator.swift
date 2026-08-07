import Foundation

protocol LinkValidating: Sendable {
    /// Asks yt-dlp whether it can extract a video from `url`, and what it offers.
    func validate(_ url: URL) async throws -> VideoLink
}

/// Support is never assumed from the host name: yt-dlp itself decides.
struct LinkValidator: LinkValidating {
    private let runner: any ProcessRunning
    private let locator: any ToolLocating

    init(runner: any ProcessRunning, locator: any ToolLocating) {
        self.runner = runner
        self.locator = locator
    }

    func validate(_ url: URL) async throws -> VideoLink {
        let executable = try locator.ytDLP()
        let outcome = try await runner.run(
            ProcessInvocation(
                executable: executable,
                arguments: [
                    "--ignore-config",
                    "--dump-single-json",
                    "--no-warnings",
                    "--no-playlist",
                    "--playlist-items", "1",
                    "--socket-timeout", "10",
                    "--retries", "1",
                    "--extractor-retries", "1",
                    url.absoluteString
                ]
            )
        )

        guard outcome.isSuccess else {
            // At this stage any failure that isn't environmental means the same
            // thing to the user: there's no video here.
            switch DropError.fromToolOutput(outcome.standardError) {
            case .noInternet: throw DropError.noInternet
            case .missingFFmpeg: throw DropError.missingFFmpeg
            default: throw DropError.unsupportedLink
            }
        }

        guard let data = outcome.standardOutput.data(using: .utf8),
              let media = try? JSONDecoder().decode(MediaInfo.self, from: data),
              let extractor = media.extractor, !extractor.isEmpty else {
            throw DropError.unsupportedLink
        }

        return VideoLink(
            url: url,
            title: media.title ?? url.absoluteString,
            extractor: extractor,
            heights: media.offeredHeights
        )
    }
}

/// The handful of fields Drop needs out of yt-dlp's metadata dump.
private struct MediaInfo: Decodable {
    let title: String?
    let extractor: String?
    let formats: [Format]?

    struct Format: Decodable {
        let height: Int?
        let vcodec: String?
    }

    /// Distinct video heights, tallest first, ignoring audio-only streams.
    var offeredHeights: [Int] {
        let heights = (formats ?? [])
            .filter { ($0.vcodec ?? "none") != "none" }
            .compactMap(\.height)
        return Array(Set(heights)).sorted(by: >)
    }
}
