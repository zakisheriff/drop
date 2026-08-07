import AppKit
import SwiftUI
import UserNotifications

struct SettingsView: View {
    @Bindable var settings: SettingsManager
    let notifications: NotificationManager

    @Environment(\.dismiss) private var dismiss

    @State private var isChoosingFolder = false
    @State private var folderMessage: String?

    var body: some View {
        VStack(spacing: 0) {
            Form {
                Section {
                    LabeledContent("Downloads Go To") {
                        HStack(spacing: 8) {
                            Text(settings.downloadFolder.path(percentEncoded: false).abbreviatingHome)
                                .lineLimit(1)
                                .truncationMode(.head)
                                .foregroundStyle(.secondary)
                            Button("Select Destination…") { isChoosingFolder = true }
                        }
                    }
                    Toggle("Automatically reveal in Finder", isOn: $settings.revealsInFinder)
                    Toggle("Play a sound when finished", isOn: $settings.playsCompletionSound)
                } header: {
                    Text("Destination")
                } footer: {
                    Text(folderMessage ?? "Every download is saved here without asking.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                Section {
                    Toggle("Monitor clipboard", isOn: $settings.monitorsClipboard)
                    Toggle("Alert me when I copy a video link", isOn: $settings.notifiesOnCopy)
                    if let problem = notificationProblem {
                        LabeledContent("Notifications") {
                            HStack(spacing: 8) {
                                Text(problem)
                                    .foregroundStyle(.secondary)
                                Button("Open…", action: openNotificationSettings)
                            }
                        }
                    }
                    Toggle("Launch at login", isOn: $settings.launchesAtLogin)
                } header: {
                    Text("Clipboard")
                } footer: {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("A Focus mode hides notification banners. Drop also badges its Dock icon, which Focus can't silence.")
                        if let message = settings.loginItemMessage {
                            Text(message)
                        }
                    }
                    .font(.callout)
                    .foregroundStyle(.secondary)
                }

                Section {
                    Toggle("Global keyboard shortcut", isOn: $settings.shortcutEnabled)
                    LabeledContent("Shortcut") {
                        ShortcutRecorderView(shortcut: $settings.shortcut)
                    }
                    .disabled(!settings.shortcutEnabled)
                } header: {
                    Text("Shortcut")
                } footer: {
                    Text("Press this shortcut anywhere to download the copied link.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                Section {
                    LabeledContent("Updates") {
                        Button("Check for Updates…") {}
                            .disabled(true)
                    }
                }
            }
            .formStyle(.grouped)

            Divider()

            HStack {
                Spacer()
                Button("Done") { dismiss() }
                    .keyboardShortcut(.defaultAction)
            }
            .padding(12)
        }
        .frame(width: 480, height: 470)
        .task { await notifications.refreshAuthorization() }
        .fileImporter(isPresented: $isChoosingFolder, allowedContentTypes: [.folder]) { result in
            guard case .success(let url) = result else { return }
            do {
                try settings.setDownloadFolder(url)
                folderMessage = nil
            } catch let error as DropError {
                folderMessage = error.recoverySuggestion
            } catch {
                folderMessage = error.localizedDescription
            }
        }
        .fileDialogDefaultDirectory(settings.downloadFolder)
        .fileDialogConfirmationLabel("Select Destination")
    }

    /// Alerts and the Dock badge are separate switches in System Settings, and
    /// either one being off explains a "nothing happened" report.
    private var notificationProblem: String? {
        if !notifications.isAuthorized { return "Turned off in System Settings" }
        if !notifications.alertsEnabled { return "Banners are off" }
        if !notifications.badgesEnabled { return "Dock badge is off" }
        return nil
    }

    private func openNotificationSettings() {
        guard let url = URL(string: "x-apple.systempreferences:com.apple.Notifications-Settings.extension") else {
            return
        }
        NSWorkspace.shared.open(url)
    }
}

private extension String {
    var abbreviatingHome: String {
        let home = NSHomeDirectory()
        return hasPrefix(home) ? "~" + dropFirst(home.count) : self
    }
}
