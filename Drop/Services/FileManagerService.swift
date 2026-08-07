import AppKit
import Foundation

protocol FileServicing: Sendable {
    var defaultDownloadFolder: URL { get }
    /// Creates the folder if needed and confirms Drop may write to it.
    func prepare(_ folder: URL) throws
    @MainActor func revealInFinder(_ file: URL)
}

struct FileManagerService: FileServicing {
    var defaultDownloadFolder: URL {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            ?? URL(filePath: NSHomeDirectory()).appending(path: "Documents")
        return documents.appending(path: "Drop")
    }

    func prepare(_ folder: URL) throws {
        let path = folder.path(percentEncoded: false)
        var isDirectory: ObjCBool = false

        if FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory) {
            guard isDirectory.boolValue else { throw DropError.invalidDestination(path) }
        } else {
            do {
                try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
            } catch {
                throw DropError.invalidDestination(path)
            }
        }

        guard FileManager.default.isWritableFile(atPath: path) else {
            throw DropError.permissionDenied
        }
    }

    @MainActor
    func revealInFinder(_ file: URL) {
        if FileManager.default.fileExists(atPath: file.path(percentEncoded: false)) {
            NSWorkspace.shared.activateFileViewerSelecting([file])
        } else {
            NSWorkspace.shared.open(file.deletingLastPathComponent())
        }
    }
}
