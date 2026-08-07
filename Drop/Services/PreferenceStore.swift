import Foundation

protocol PreferenceStoring: Sendable {
    var downloadFolder: URL? { get nonmutating set }
    var notifiesOnCopy: Bool { get nonmutating set }
    var revealsInFinder: Bool { get nonmutating set }
    var playsCompletionSound: Bool { get nonmutating set }
    var monitorsClipboard: Bool { get nonmutating set }
    var shortcutEnabled: Bool { get nonmutating set }
    var shortcut: GlobalShortcut? { get nonmutating set }
}

/// Thin, typed access to `UserDefaults`. No business logic lives here.
struct UserDefaultsPreferenceStore: PreferenceStoring {
    private enum Key {
        static let downloadFolder = "downloadFolderPath"
        static let notifiesOnCopy = "notifiesOnCopy"
        static let revealsInFinder = "revealsInFinder"
        static let playsCompletionSound = "playsCompletionSound"
        static let monitorsClipboard = "monitorsClipboard"
        static let shortcutEnabled = "shortcutEnabled"
        static let shortcut = "globalShortcut"
    }

    /// `UserDefaults` is thread-safe; the compiler simply can't prove it.
    nonisolated(unsafe) private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        defaults.register(defaults: [
            Key.notifiesOnCopy: true,
            Key.revealsInFinder: true,
            Key.playsCompletionSound: true,
            Key.monitorsClipboard: true,
            Key.shortcutEnabled: true
        ])
    }

    var downloadFolder: URL? {
        get {
            guard let path = defaults.string(forKey: Key.downloadFolder), !path.isEmpty else { return nil }
            return URL(filePath: path)
        }
        nonmutating set {
            defaults.set(newValue?.path(percentEncoded: false), forKey: Key.downloadFolder)
        }
    }

    var notifiesOnCopy: Bool {
        get { defaults.bool(forKey: Key.notifiesOnCopy) }
        nonmutating set { defaults.set(newValue, forKey: Key.notifiesOnCopy) }
    }

    var revealsInFinder: Bool {
        get { defaults.bool(forKey: Key.revealsInFinder) }
        nonmutating set { defaults.set(newValue, forKey: Key.revealsInFinder) }
    }

    var playsCompletionSound: Bool {
        get { defaults.bool(forKey: Key.playsCompletionSound) }
        nonmutating set { defaults.set(newValue, forKey: Key.playsCompletionSound) }
    }

    var monitorsClipboard: Bool {
        get { defaults.bool(forKey: Key.monitorsClipboard) }
        nonmutating set { defaults.set(newValue, forKey: Key.monitorsClipboard) }
    }

    var shortcutEnabled: Bool {
        get { defaults.bool(forKey: Key.shortcutEnabled) }
        nonmutating set { defaults.set(newValue, forKey: Key.shortcutEnabled) }
    }

    var shortcut: GlobalShortcut? {
        get {
            guard let data = defaults.data(forKey: Key.shortcut) else { return .controlD }
            return try? JSONDecoder().decode(GlobalShortcut.self, from: data)
        }
        nonmutating set {
            defaults.set(newValue.flatMap { try? JSONEncoder().encode($0) }, forKey: Key.shortcut)
        }
    }
}
