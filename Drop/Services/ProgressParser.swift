import Foundation

/// Interprets the machine-readable lines Drop asks yt-dlp to print.
struct ProgressParser: Sendable {
    private static let progressPrefix = "[drop.progress]"
    private static let postProcessPrefix = "[drop.post]"
    private static let filePrefix = "[drop.file]"

    enum Line: Equatable, Sendable {
        case progress(DownloadProgress)
        case postProcessing(String)
        case destination(URL)
    }

    /// Byte counts for the stream currently being transferred.
    static var downloadTemplate: String {
        "download:" + progressPrefix
            + "%(progress.downloaded_bytes)s|%(progress.total_bytes)s"
            + "|%(progress.total_bytes_estimate)s|%(progress.speed)s|%(progress.eta)s"
    }

    /// Named stages after the transfer — Merger, MoveFiles, and so on.
    static var postProcessTemplate: String {
        "postprocess:" + postProcessPrefix + "%(progress.status)s|%(progress.postprocessor)s"
    }

    /// The final path, printed once the file has reached its destination.
    static var filenameTemplate: String {
        "after_move:" + filePrefix + "%(filepath)s"
    }

    func parse(_ line: String) -> Line? {
        if line.hasPrefix(Self.filePrefix) {
            let path = String(line.dropFirst(Self.filePrefix.count))
            guard !path.isEmpty else { return nil }
            return .destination(URL(filePath: path))
        }

        if line.hasPrefix(Self.postProcessPrefix) {
            let fields = line.dropFirst(Self.postProcessPrefix.count).split(separator: "|")
            guard fields.count == 2, fields[0] == "started" else { return nil }
            return .postProcessing(String(fields[1]))
        }

        guard line.hasPrefix(Self.progressPrefix) else { return nil }
        let fields = line.dropFirst(Self.progressPrefix.count).split(
            separator: "|",
            omittingEmptySubsequences: false
        )
        guard fields.count == 5 else { return nil }

        return .progress(
            DownloadProgress(
                completedBytes: integer(fields[0]),
                totalBytes: integer(fields[1]) ?? integer(fields[2]),
                bytesPerSecond: double(fields[3]),
                secondsRemaining: double(fields[4])
            )
        )
    }

    private func integer(_ field: Substring) -> Int64? {
        guard let value = double(field) else { return nil }
        return Int64(value)
    }

    private func double(_ field: Substring) -> Double? {
        let trimmed = field.trimmingCharacters(in: .whitespaces)
        guard trimmed != "NA", trimmed != "None", !trimmed.isEmpty else { return nil }
        return Double(trimmed)
    }
}
