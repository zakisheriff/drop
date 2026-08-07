import AppKit
import SwiftUI

/// Captures a key combination the way System Settings does: click, then type.
struct ShortcutRecorderView: View {
    @Binding var shortcut: GlobalShortcut

    @State private var isRecording = false
    @State private var recorder = KeyRecorder()

    var body: some View {
        Button(isRecording ? "Type Shortcut…" : shortcut.displayString) {
            isRecording ? stop() : start()
        }
        .frame(minWidth: 96)
        .help("Click, then press the key combination you want to use.")
        .onDisappear(perform: stop)
    }

    private func start() {
        isRecording = true
        recorder.start { captured in
            if let captured { shortcut = captured }
            isRecording = false
        }
    }

    private func stop() {
        recorder.stop()
        isRecording = false
    }
}

/// Watches key presses while the recorder button is armed. A local monitor is
/// the only way to read a raw key code from SwiftUI.
@MainActor
@Observable
final class KeyRecorder {
    private var monitor: Any?

    func start(completion: @escaping (GlobalShortcut?) -> Void) {
        stop()
        monitor = NSEvent.addLocalMonitorForEvents(matching: .keyDown) { [weak self] event in
            guard let self else { return event }
            self.stop()
            completion(Self.shortcut(from: event))
            return nil
        }
    }

    func stop() {
        if let monitor {
            NSEvent.removeMonitor(monitor)
            self.monitor = nil
        }
    }

    private static func shortcut(from event: NSEvent) -> GlobalShortcut? {
        let flags = event.modifierFlags
            .intersection(.deviceIndependentFlagsMask)
            .subtracting([.capsLock, .function, .numericPad])

        guard event.keyCode != 53 else { return nil }  // Escape cancels
        guard let label = label(for: event) else { return nil }

        let candidate = GlobalShortcut(
            keyCode: event.keyCode,
            modifierFlags: flags.rawValue,
            keyLabel: label
        )
        return candidate.isValid ? candidate : nil
    }

    private static func label(for event: NSEvent) -> String? {
        switch Int(event.keyCode) {
        case 36: return "↩"
        case 48: return "⇥"
        case 49: return "Space"
        case 51: return "⌫"
        case 117: return "⌦"
        case 123: return "←"
        case 124: return "→"
        case 125: return "↓"
        case 126: return "↑"
        default: break
        }
        guard let characters = event.charactersIgnoringModifiers, !characters.isEmpty else {
            return nil
        }
        return characters.uppercased()
    }
}
