import Foundation

/// A key combination usable as a system-wide hot key.
struct GlobalShortcut: Codable, Equatable, Sendable {
    /// Virtual key code as reported by the window server.
    var keyCode: UInt16
    /// `NSEvent.ModifierFlags` raw value, already masked to device-independent flags.
    var modifierFlags: UInt
    /// Character shown in the UI, e.g. "D" or "↩".
    var keyLabel: String

    /// Control–D, per Drop's default configuration.
    static let controlD = GlobalShortcut(keyCode: 0x02, modifierFlags: 1 << 18, keyLabel: "D")

    var displayString: String {
        var symbols = ""
        if modifierFlags & (1 << 18) != 0 { symbols += "⌃" }
        if modifierFlags & (1 << 19) != 0 { symbols += "⌥" }
        if modifierFlags & (1 << 17) != 0 { symbols += "⇧" }
        if modifierFlags & (1 << 20) != 0 { symbols += "⌘" }
        return symbols + keyLabel
    }

    /// At least one non-shift modifier is required for a usable global hot key.
    var isValid: Bool {
        modifierFlags & ((1 << 18) | (1 << 19) | (1 << 20)) != 0 && !keyLabel.isEmpty
    }
}
