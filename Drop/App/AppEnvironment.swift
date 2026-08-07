import Foundation

/// Composition root. Every dependency is created once, here, and injected.
@MainActor
enum AppEnvironment {
    static func makeViewModel() -> DropViewModel {
        let runner = ProcessRunner()
        let locator = ToolLocator()
        let files = FileManagerService()
        let settings = SettingsManager(
            store: UserDefaultsPreferenceStore(),
            files: files,
            loginItems: LoginItemService()
        )

        return DropViewModel(
            settings: settings,
            clipboard: ClipboardMonitor(),
            validator: LinkValidator(runner: runner, locator: locator),
            downloads: DownloadService(runner: runner, locator: locator),
            files: files,
            notifications: NotificationManager(),
            shortcuts: ShortcutManager(),
            tools: locator
        )
    }
}
