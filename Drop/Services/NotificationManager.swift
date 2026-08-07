import Foundation
import OSLog
import UserNotifications

/// Native alerts for copied links and finished downloads.
@MainActor
@Observable
final class NotificationManager: NSObject {
    enum Response: Sendable {
        case downloadRequested(URL)
        case formatChoiceRequested(URL)
        case revealRequested(URL)
    }

    private enum Category {
        static let link = "drop.link"
        static let finished = "drop.finished"
    }

    private enum Action {
        static let download = "drop.action.download"
        static let chooseFormat = "drop.action.chooseFormat"
        static let dismiss = "drop.action.dismiss"
        static let reveal = "drop.action.reveal"
    }

    private enum Key {
        static let url = "url"
        static let file = "file"
    }

    private let center = UNUserNotificationCenter.current()
    private let logger = Logger(subsystem: "com.atomoriginals.Drop", category: "notifications")

    /// Mirrors System Settings, so Drop can explain itself when it's muted.
    private(set) var authorization: UNAuthorizationStatus = .notDetermined
    private(set) var alertsEnabled = false
    private(set) var badgesEnabled = false

    var isAuthorized: Bool {
        authorization == .authorized || authorization == .provisional
    }

    /// Called on the main actor when the user taps a notification action.
    var onResponse: ((Response) -> Void)?

    /// Installs the delegate and categories. Cheap, and safe to call at launch.
    func configure() {
        center.delegate = self
        center.setNotificationCategories([
            UNNotificationCategory(
                identifier: Category.link,
                actions: [
                    UNNotificationAction(identifier: Action.download, title: "Download", options: []),
                    UNNotificationAction(
                        identifier: Action.chooseFormat,
                        title: "Choose Format…",
                        options: [.foreground]
                    ),
                    UNNotificationAction(identifier: Action.dismiss, title: "Dismiss", options: [])
                ],
                intentIdentifiers: []
            ),
            UNNotificationCategory(
                identifier: Category.finished,
                actions: [
                    UNNotificationAction(identifier: Action.reveal, title: "Show in Finder", options: [])
                ],
                intentIdentifiers: []
            )
        ])
    }

    /// The user may take as long as they like with the system prompt, so this is
    /// never awaited on a path that gates the rest of the app.
    func requestAuthorization() async {
        do {
            _ = try await center.requestAuthorization(options: [.alert, .sound, .badge])
        } catch {
            logger.error("authorization request failed: \(error.localizedDescription, privacy: .public)")
        }
        await refreshAuthorization()
    }

    func refreshAuthorization() async {
        let settings = await center.notificationSettings()
        authorization = settings.authorizationStatus
        alertsEnabled = settings.alertSetting == .enabled
        badgesEnabled = settings.badgeSetting == .enabled
        logger.info("""
            notifications: status=\(settings.authorizationStatus.rawValue, privacy: .public) \
            alert=\(settings.alertSetting.rawValue, privacy: .public) \
            badge=\(settings.badgeSetting.rawValue, privacy: .public)
            """)
    }

    func offerDownload(for link: VideoLink) {
        let content = UNMutableNotificationContent()
        content.title = "Download copied video?"
        content.subtitle = link.title
        content.body = link.heights.first.map { "Up to \($0)p · \(link.extractor)" } ?? link.extractor
        content.categoryIdentifier = Category.link
        content.userInfo = [Key.url: link.url.absoluteString]
        post(content)
    }

    func announceCompletion(title: String, file: URL?) {
        let content = UNMutableNotificationContent()
        content.title = "Download Finished"
        content.body = title
        content.sound = .default
        if let file {
            content.categoryIdentifier = Category.finished
            content.userInfo = [Key.file: file.path(percentEncoded: false)]
        }
        post(content)
    }

    func announceFailure(_ error: DropError) {
        let content = UNMutableNotificationContent()
        content.title = error.errorDescription ?? "Download Failed"
        content.body = error.recoverySuggestion ?? ""
        post(content)
    }

    private func post(_ content: UNMutableNotificationContent) {
        guard isAuthorized else {
            logger.notice("suppressed notification; not authorized")
            return
        }
        center.add(UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil))
    }
}

extension NotificationManager: UNUserNotificationCenterDelegate {
    nonisolated func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification
    ) async -> UNNotificationPresentationOptions {
        [.banner, .sound]
    }

    nonisolated func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse
    ) async {
        let info = response.notification.request.content.userInfo
        let identifier = response.actionIdentifier
        let link = (info[Key.url] as? String).flatMap(URL.init(string:))
        let file = (info[Key.file] as? String).map { URL(filePath: $0) }

        await MainActor.run {
            switch identifier {
            case Action.download:
                if let link { self.onResponse?(.downloadRequested(link)) }
            case Action.chooseFormat:
                if let link { self.onResponse?(.formatChoiceRequested(link)) }
            case Action.reveal:
                if let file { self.onResponse?(.revealRequested(file)) }
            case UNNotificationDefaultActionIdentifier:
                if let file { self.onResponse?(.revealRequested(file)) }
                if let link { self.onResponse?(.formatChoiceRequested(link)) }
            default:
                break
            }
        }
    }
}
