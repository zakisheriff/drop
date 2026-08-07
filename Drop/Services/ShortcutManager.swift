import AppKit
import Carbon.HIToolbox

/// Registers Drop's system-wide hot key with the Carbon hot key API, which is
/// the only way to observe key presses outside the app without requesting
/// Accessibility access.
@MainActor
final class ShortcutManager {
    private static let signature: OSType = 0x44_52_4F_50  // 'DROP'
    private static weak var active: ShortcutManager?

    private var hotKey: EventHotKeyRef?
    private var handler: EventHandlerRef?

    private(set) var isRegistered = false

    /// Called on the main actor when the hot key is pressed.
    var onTrigger: (() -> Void)?

    isolated deinit {
        if let hotKey { UnregisterEventHotKey(hotKey) }
        if let handler { RemoveEventHandler(handler) }
    }

    /// Installs `shortcut`, replacing any previous registration.
    /// Passing `nil` removes the hot key.
    @discardableResult
    func apply(_ shortcut: GlobalShortcut?) -> Bool {
        unregister()
        guard let shortcut, shortcut.isValid else { return false }

        Self.active = self
        installHandlerIfNeeded()

        var reference: EventHotKeyRef?
        let identifier = EventHotKeyID(signature: Self.signature, id: 1)
        let status = RegisterEventHotKey(
            UInt32(shortcut.keyCode),
            Self.carbonModifiers(from: shortcut.modifierFlags),
            identifier,
            GetEventDispatcherTarget(),
            0,
            &reference
        )

        guard status == noErr, let reference else { return false }
        hotKey = reference
        isRegistered = true
        return true
    }

    func unregister() {
        if let hotKey {
            UnregisterEventHotKey(hotKey)
            self.hotKey = nil
        }
        isRegistered = false
    }

    private func installHandlerIfNeeded() {
        guard handler == nil else { return }
        var specification = EventTypeSpec(
            eventClass: OSType(kEventClassKeyboard),
            eventKind: UInt32(kEventHotKeyPressed)
        )
        InstallEventHandler(GetEventDispatcherTarget(), hotKeyEventHandler, 1, &specification, nil, &handler)
    }

    fileprivate func trigger() {
        onTrigger?()
    }

    fileprivate nonisolated static func dispatch() {
        MainActor.assumeIsolated { active?.trigger() }
    }

    private static func carbonModifiers(from flags: UInt) -> UInt32 {
        let modifiers = NSEvent.ModifierFlags(rawValue: flags)
        var carbon: UInt32 = 0
        if modifiers.contains(.control) { carbon |= UInt32(controlKey) }
        if modifiers.contains(.option) { carbon |= UInt32(optionKey) }
        if modifiers.contains(.shift) { carbon |= UInt32(shiftKey) }
        if modifiers.contains(.command) { carbon |= UInt32(cmdKey) }
        return carbon
    }
}

/// C callbacks cannot capture context, so the press is routed back through the
/// manager that owns the registration.
private let hotKeyEventHandler: EventHandlerUPP = { _, event, _ in
    var identifier = EventHotKeyID()
    let status = GetEventParameter(
        event,
        EventParamName(kEventParamDirectObject),
        EventParamType(typeEventHotKeyID),
        nil,
        MemoryLayout<EventHotKeyID>.size,
        nil,
        &identifier
    )
    guard status == noErr else { return status }
    DispatchQueue.main.async { ShortcutManager.dispatch() }
    return noErr
}
