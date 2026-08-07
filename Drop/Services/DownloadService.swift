import Foundation

struct DownloadRequest: Sendable {
    var link: VideoLink
    var destination: URL
    var format: DownloadFormat = .best
}

protocol DownloadServicing: Sendable {
    /// Runs yt-dlp for `request`, reporting progress until the file is on disk.
    /// Cancelling the consuming task stops yt-dlp.
    func download(_ request: DownloadRequest) -> AsyncThrowingStream<DownloadEvent, any Error>
}

/// Drives yt-dlp: best video plus best audio, merged into an MP4.
struct DownloadService: DownloadServicing {
    private let runner: any ProcessRunning
    private let locator: any ToolLocating
    private let parser = ProgressParser()

    init(runner: any ProcessRunning, locator: any ToolLocating) {
        self.runner = runner
        self.locator = locator
    }

    func download(_ request: DownloadRequest) -> AsyncThrowingStream<DownloadEvent, any Error> {
        AsyncThrowingStream { continuation in
            let task = Task {
                do {
                    try await run(request, into: continuation)
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }
            continuation.onTermination = { reason in
                if case .cancelled = reason { task.cancel() }
            }
        }
    }

    private func run(
        _ request: DownloadRequest,
        into continuation: AsyncThrowingStream<DownloadEvent, any Error>.Continuation
    ) async throws {
        let tools = try locator.resolveAll()
        continuation.yield(.phase(.preparing))

        var errorOutput: [String] = []
        var destinationFile: URL?
        var phase = DownloadPhase.preparing
        var status: Int32 = -1

        let invocation = ProcessInvocation(
            executable: tools.ytDLP,
            arguments: arguments(for: request, ffmpeg: tools.ffmpeg)
        )

        for try await event in runner.stream(invocation) {
            let line: String
            switch event {
            case .standardOutput(let value): line = value
            case .standardError(let value): line = value
            case .exited(let code):
                status = code
                continue
            }

            guard let parsed = parser.parse(line) else {
                if case .standardError = event { errorOutput.append(line) }
                continue
            }

            switch parsed {
            case .progress(let progress):
                if phase != .downloading {
                    phase = .downloading
                    continuation.yield(.phase(.downloading))
                }
                continuation.yield(.progress(progress))
            case .postProcessing(let name):
                // Moving the finished file is instant and not worth announcing.
                guard name != "MoveFiles", phase != .merging else { break }
                phase = .merging
                continuation.yield(.phase(.merging))
            case .destination(let url):
                destinationFile = url
            }
        }

        try Task.checkCancellation()

        guard status == 0 else {
            throw DropError.fromToolOutput(errorOutput.joined(separator: "\n"))
        }
        continuation.yield(.finished(destinationFile))
    }

    private func arguments(for request: DownloadRequest, ffmpeg: URL) -> [String] {
        var arguments = [
            "--ignore-config",
            "--newline",
            "--no-color",
            "--no-warnings",
            "--progress",
            "--no-simulate",
            "--no-playlist",
            "--no-mtime",
            "--retries", "5",
            "--fragment-retries", "5",
            "--concurrent-fragments", "4",
            "--ffmpeg-location", ffmpeg.deletingLastPathComponent().path(percentEncoded: false),
            "--paths", request.destination.path(percentEncoded: false),
            "--output", "%(title)s.%(ext)s",
            "--progress-template", ProgressParser.downloadTemplate,
            "--progress-template", ProgressParser.postProcessTemplate,
            "--print", ProgressParser.filenameTemplate
        ]
        arguments += request.format.arguments
        arguments.append(request.link.url.absoluteString)
        return arguments
    }
}
