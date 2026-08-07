import Foundation

struct ProcessInvocation: Sendable {
    var executable: URL
    var arguments: [String]
    var environment: [String: String]?
}

enum ProcessEvent: Sendable {
    case standardOutput(String)
    case standardError(String)
    case exited(status: Int32)
}

struct ProcessOutcome: Sendable {
    var status: Int32
    var standardOutput: String
    var standardError: String

    var isSuccess: Bool { status == 0 }
}

protocol ProcessRunning: Sendable {
    /// Line-by-line output of a child process, finishing with its exit status.
    /// Cancelling the consuming task terminates the process.
    func stream(_ invocation: ProcessInvocation) -> AsyncThrowingStream<ProcessEvent, any Error>
}

extension ProcessRunning {
    /// Convenience for short-lived processes whose output fits in memory.
    func run(_ invocation: ProcessInvocation) async throws -> ProcessOutcome {
        var standardOutput: [String] = []
        var standardError: [String] = []
        var status: Int32 = -1

        for try await event in stream(invocation) {
            switch event {
            case .standardOutput(let line): standardOutput.append(line)
            case .standardError(let line): standardError.append(line)
            case .exited(let code): status = code
            }
        }

        return ProcessOutcome(
            status: status,
            standardOutput: standardOutput.joined(separator: "\n"),
            standardError: standardError.joined(separator: "\n")
        )
    }
}

/// Runs child processes and republishes their output as an async sequence.
struct ProcessRunner: ProcessRunning {
    func stream(_ invocation: ProcessInvocation) -> AsyncThrowingStream<ProcessEvent, any Error> {
        AsyncThrowingStream { continuation in
            let process = Process()
            process.executableURL = invocation.executable
            process.arguments = invocation.arguments
            process.environment = invocation.environment ?? ProcessEnvironment.toolEnvironment
            process.standardInput = FileHandle.nullDevice

            let standardOutput = Pipe()
            let standardError = Pipe()
            process.standardOutput = standardOutput
            process.standardError = standardError

            let collector = OutputCollector(continuation: continuation)
            let handle = ProcessHandle(process: process)

            standardOutput.fileHandleForReading.readabilityHandler = { file in
                collector.consume(file.availableData, from: .standardOutput, of: file)
            }
            standardError.fileHandleForReading.readabilityHandler = { file in
                collector.consume(file.availableData, from: .standardError, of: file)
            }
            process.terminationHandler = { finished in
                collector.processDidExit(status: finished.terminationStatus)
            }

            continuation.onTermination = { reason in
                if case .cancelled = reason { handle.terminate() }
            }

            do {
                try process.run()
            } catch {
                let name = invocation.executable.lastPathComponent
                continuation.finish(
                    throwing: DropError.toolLaunchFailed(
                        tool: name,
                        reason: error.localizedDescription
                    )
                )
            }
        }
    }
}

/// Wraps a non-`Sendable` `Process` so cancellation can reach it.
private final class ProcessHandle: @unchecked Sendable {
    private let process: Process

    init(process: Process) {
        self.process = process
    }

    func terminate() {
        guard process.isRunning else { return }
        process.terminate()
    }
}

/// Splits pipe data into lines and finishes the stream once both pipes hit
/// end-of-file *and* the process has reported its exit status.
private final class OutputCollector: @unchecked Sendable {
    enum Channel { case standardOutput, standardError }

    private let continuation: AsyncThrowingStream<ProcessEvent, any Error>.Continuation
    private let lock = NSLock()
    private var buffers: [Data] = [Data(), Data()]
    private var openChannels = 2
    private var exitStatus: Int32?
    private var isFinished = false

    init(continuation: AsyncThrowingStream<ProcessEvent, any Error>.Continuation) {
        self.continuation = continuation
    }

    func consume(_ data: Data, from channel: Channel, of file: FileHandle) {
        guard !data.isEmpty else {
            file.readabilityHandler = nil
            lock.lock()
            let remainder = drainBuffer(for: channel)
            openChannels -= 1
            lock.unlock()
            emit(remainder, on: channel)
            finishIfComplete()
            return
        }

        lock.lock()
        let lines = appendAndSplit(data, for: channel)
        lock.unlock()
        emit(lines, on: channel)
    }

    func processDidExit(status: Int32) {
        lock.lock()
        exitStatus = status
        lock.unlock()
        finishIfComplete()
    }

    private func index(of channel: Channel) -> Int {
        channel == .standardOutput ? 0 : 1
    }

    /// Caller holds `lock`.
    private func appendAndSplit(_ data: Data, for channel: Channel) -> [String] {
        let slot = index(of: channel)
        buffers[slot].append(data)

        var lines: [String] = []
        while let breakIndex = buffers[slot].firstIndex(where: { $0 == 0x0A || $0 == 0x0D }) {
            let lineData = buffers[slot][buffers[slot].startIndex..<breakIndex]
            buffers[slot].removeSubrange(buffers[slot].startIndex...breakIndex)
            if let line = String(data: lineData, encoding: .utf8), !line.isEmpty {
                lines.append(line)
            }
        }
        return lines
    }

    /// Caller holds `lock`.
    private func drainBuffer(for channel: Channel) -> [String] {
        let slot = index(of: channel)
        defer { buffers[slot] = Data() }
        guard let text = String(data: buffers[slot], encoding: .utf8), !text.isEmpty else {
            return []
        }
        return text.split(whereSeparator: \.isNewline).map(String.init)
    }

    private func emit(_ lines: [String], on channel: Channel) {
        for line in lines {
            continuation.yield(channel == .standardOutput ? .standardOutput(line) : .standardError(line))
        }
    }

    private func finishIfComplete() {
        lock.lock()
        guard !isFinished, openChannels == 0, let status = exitStatus else {
            lock.unlock()
            return
        }
        isFinished = true
        lock.unlock()

        continuation.yield(.exited(status: status))
        continuation.finish()
    }
}

enum ProcessEnvironment {
    /// Homebrew's locations are absent from the environment of a launched app,
    /// so yt-dlp is given a PATH where it can find FFmpeg and its helpers.
    static let toolEnvironment: [String: String] = {
        var environment = ProcessInfo.processInfo.environment
        let existing = environment["PATH"].map { $0.split(separator: ":").map(String.init) } ?? []
        let combined = ToolLocator.searchPaths + existing
        var seen = Set<String>()
        environment["PATH"] = combined.filter { seen.insert($0).inserted }.joined(separator: ":")
        environment["LC_ALL"] = "en_US.UTF-8"
        return environment
    }()
}
