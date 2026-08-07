# Drop

Copy. Download. Done.

A native macOS utility that notices video links on your clipboard and downloads them in one click. Every site yt-dlp supports works — support is never hardcoded, it's decided by asking yt-dlp itself.

## Requirements

- macOS 15 or later
- Xcode 26 or later (to build)
- yt-dlp and ffmpeg:

```
brew install yt-dlp ffmpeg
```

Drop finds them in `/opt/homebrew/bin`, `/usr/local/bin`, `/opt/local/bin`, `/usr/bin`, and `~/.local/bin`. If either is missing, Drop says so and offers to copy the Homebrew command.

## Build & run

```
xcodebuild -project Drop.xcodeproj -scheme Drop -configuration Release build
```

Or open `Drop.xcodeproj` in Xcode and press Run.

## How it works

Drop polls the pasteboard's change count a couple of times a second — no notifications exist for clipboard changes, and reading a counter costs nothing. When it changes, Drop runs `yt-dlp --simulate --print` against the link. If yt-dlp can extract a video, the link and its title appear and Download becomes available; if not, the field reads "No supported video link found."

Validation uses `--dump-single-json`, so the same call that proves the link is supported also reports which resolutions it offers. The Format menu is built from that: the link's true maximum named with its real height (`Highest (2026p)`), every standard rung below it (1440p, 1080p, 720p, …), plus audio-only M4A and MP3.

Download starts immediately — no prompts. The destination is set once, in Settings, and every download goes there.

Downloading runs `yt-dlp` with the selected format — video merges to `mp4`, audio-only extracts to `m4a` or `mp3` with machine-readable progress templates, so the progress bar reflects real byte counts rather than scraped console text. Cancelling terminates the child process; the partial `.part` file is left behind so a re-download resumes.

## Layout

```
Drop/
  App/          DropApp, AppEnvironment (composition root)
  Models/       DropError, DownloadModels, GlobalShortcut
  Services/     ProcessRunner, ToolLocator, LinkValidator, DownloadService,
                ProgressParser, ClipboardMonitor, FileManagerService,
                NotificationManager, ShortcutManager, LoginItemService,
                PreferenceStore, SettingsManager
  ViewModels/   DropViewModel
  Views/        ContentView, StatusBarView, SettingsView, ShortcutRecorderView
```

Services are protocol-backed and injected in `AppEnvironment`; views hold no logic.

Copying a link while Drop is in the background posts a notification with **Download**, **Choose Format…**, and **Dismiss**, and badges the Dock icon. Drop has to be running for any of that — turn on Launch at Login in Settings if you want it always watching.

Two macOS switches decide whether you actually see it, and Settings reports both: a **Focus mode hides all banners** (the Dock badge still gets through), and **Notifications › Drop › Badge app icon** must be on for the badge. If either is off, Settings shows why with a button straight to the right pane.

## Notes

- **The default global shortcut is ⌃D**, as specified. Because it is registered system-wide, it takes ⌃D away from every other app — including Terminal, where ⌃D means end-of-input. Change it or switch it off in Settings if that matters to you.
- Drop runs unsandboxed. It has to launch Homebrew binaries, which the App Sandbox forbids.
- Launch at Login uses `SMAppService`, which needs the app in a stable location (`/Applications`) to persist reliably.
