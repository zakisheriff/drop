import SwiftUI

/// The bottom line: what Drop is doing, and how far along it is.
struct StatusBarView: View {
    let model: DropViewModel

    var body: some View {
        HStack(spacing: 8) {
            Text(model.status.text)
                .foregroundStyle(.secondary)

            Spacer(minLength: 8)

            if let detail = transferDetail {
                Text(detail)
                    .foregroundStyle(.tertiary)
                    .monospacedDigit()
            } else if !model.status.isBusy {
                Text("Saving to \(model.downloadFolderName)")
                    .foregroundStyle(.tertiary)
                    .lineLimit(1)
                    .truncationMode(.middle)
            }

            if model.status.isBusy {
                progress
            }
        }
        .font(.subheadline)
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
    }

    @ViewBuilder
    private var progress: some View {
        if let fraction = model.status.progress?.fraction {
            ProgressView(value: fraction)
                .progressViewStyle(.linear)
                .frame(width: 110)
        } else {
            ProgressView()
                .progressViewStyle(.circular)
                .controlSize(.small)
        }
    }

    private var transferDetail: String? {
        guard let progress = model.status.progress else { return nil }
        var parts: [String] = []

        if let completed = progress.completedBytes {
            let done = completed.formatted(.byteCount(style: .file))
            if let total = progress.totalBytes {
                parts.append("\(done) of \(total.formatted(.byteCount(style: .file)))")
            } else {
                parts.append(done)
            }
        }
        if let speed = progress.bytesPerSecond, speed > 0 {
            parts.append("\(Int64(speed).formatted(.byteCount(style: .file)))/s")
        }
        if let remaining = progress.secondsRemaining, remaining > 0 {
            parts.append(
                Duration.seconds(Int(remaining)).formatted(.time(pattern: .minuteSecond)) + " left"
            )
        }
        return parts.isEmpty ? nil : parts.joined(separator: " · ")
    }
}
