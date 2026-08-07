import SwiftUI

@main
struct DropApp: App {
    @State private var model = AppEnvironment.makeViewModel()

    var body: some Scene {
        Window("Drop", id: "main") {
            ContentView(model: model)
        }
        .defaultSize(width: 560, height: 360)
        .windowResizability(.contentMinSize)
        .commands {
            CommandGroup(replacing: .newItem) {
                Button("Download") { model.download() }
                    .keyboardShortcut("d", modifiers: .command)
                    .disabled(!model.canDownload)
                Button("Choose Download Folder…") { model.chooseFolder() }
                    .keyboardShortcut("o", modifiers: .command)
                Divider()
                Button("Show Last Download in Finder") { model.revealLastDownload() }
                    .keyboardShortcut("r", modifiers: [.command, .shift])
                    .disabled(model.lastDownloadedFile == nil)
            }
            CommandGroup(replacing: .appSettings) {
                Button("Settings…") { model.isSettingsPresented = true }
                    .keyboardShortcut(",", modifiers: .command)
            }
        }
    }
}
