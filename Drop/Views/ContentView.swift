import SwiftUI

struct ContentView: View {
    private static let fieldWidth: CGFloat = 380

    @Bindable var model: DropViewModel

    @FocusState private var isLinkFieldFocused: Bool

    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 0)
            main
            Spacer(minLength: 0)
            Divider()
            StatusBarView(model: model)
        }
        .frame(minWidth: 460, minHeight: 300)
        // Sits behind the content, so clicking anywhere that isn't a control
        // gives up focus the way a Mac app should.
        .background {
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture(perform: clearFocus)
        }
        .defaultFocus($isLinkFieldFocused, false)
        .onAppear { model.onAppear() }
        .onReceive(NotificationCenter.default.publisher(for: NSApplication.didBecomeActiveNotification)) { _ in
            model.windowDidBecomeActive()
        }
        .sheet(isPresented: $model.isSettingsPresented) {
            SettingsView(settings: model.settings, notifications: model.notifications)
        }
        .fileImporter(
            isPresented: $model.isFolderImporterPresented,
            allowedContentTypes: [.folder]
        ) { result in
            model.folderSelected(result)
        }
        .fileDialogDefaultDirectory(model.settings.downloadFolder)
        .fileDialogConfirmationLabel("Select Destination")
        .alert(
            model.alert?.title ?? "",
            isPresented: isAlertPresented,
            presenting: model.alert
        ) { alert in
            if let command = alert.installCommand {
                Button("Copy Command") { copy(command) }
            }
            Button("OK", role: .cancel) {}
        } message: { alert in
            Text(alert.message)
        }
    }

    private var main: some View {
        VStack(spacing: 20) {
            wordmark

            VStack(spacing: 5) {
                TextField(
                    "Copied Link",
                    text: .constant(model.urlText),
                    prompt: Text("No supported video link found.")
                )
                .textFieldStyle(.roundedBorder)
                .labelsHidden()
                .lineLimit(1)
                .frame(maxWidth: Self.fieldWidth)
                .focused($isLinkFieldFocused)
                .focusEffectDisabled()
                .accessibilityLabel("Copied link")

                Text(model.subtitle ?? " ")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .frame(maxWidth: Self.fieldWidth)
            }

            Picker("Format:", selection: $model.selectedFormat) {
                ForEach(model.formatOptions) { format in
                    Text(format.name).tag(format)
                }
            }
            .pickerStyle(.menu)
            .fixedSize()
            .disabled(model.link == nil || model.status.isBusy)

            HStack(spacing: 10) {
                Button("Settings…") {
                    clearFocus()
                    model.isSettingsPresented = true
                }
                .keyboardShortcut(",", modifiers: .command)

                if model.status.isBusy {
                    Button("Cancel") { model.cancel() }
                        .keyboardShortcut(.cancelAction)
                } else {
                    Button("Download") {
                        clearFocus()
                        model.download()
                    }
                    .keyboardShortcut(.defaultAction)
                    .disabled(!model.canDownload)
                }
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)

            Button("Support") {
                if let url = URL(string: "https://buymeacoffee.com/theoneatom") {
                    NSWorkspace.shared.open(url)
                }
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 24)
    }

    /// D R O P, letter-spaced to the width of the link field beneath it.
    private var wordmark: some View {
        HStack(spacing: 0) {
            ForEach(Array("DROP".enumerated()), id: \.offset) { _, letter in
                Text(String(letter))
                    .frame(maxWidth: .infinity)
            }
        }
        .font(.system(size: 30, weight: .semibold))
        .foregroundStyle(model.canDownload ? AnyShapeStyle(.tint) : AnyShapeStyle(.primary))
        .frame(width: Self.fieldWidth)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Drop")
        .accessibilityAddTraits(.isHeader)
    }

    private var isAlertPresented: Binding<Bool> {
        Binding(
            get: { model.alert != nil },
            set: { if !$0 { model.alert = nil } }
        )
    }

    private func clearFocus() {
        isLinkFieldFocused = false
    }

    private func copy(_ command: String) {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(command, forType: .string)
    }
}
