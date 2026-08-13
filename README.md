# <div align="center">Drop</div>

<div align="center">
<strong>100% Free, Native macOS Utility for Instant Video Downloads</strong>
</div>

<br />

<div align="center">

![Swift](https://img.shields.io/badge/Swift-6.0+-f05138?style=for-the-badge&logo=swift&logoColor=white)
![macOS](https://img.shields.io/badge/macOS-15.0+-000000?style=for-the-badge&logo=apple&logoColor=white)
![Next.js](https://img.shields.io/badge/Next.js-16.3-000000?style=for-the-badge&logo=next.js&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

<br />

<a href="https://drop.theatom.lk">
<img src="https://img.shields.io/badge/View%20Live%20Site-Click%20Here-0071e3?style=for-the-badge&logo=safari&logoColor=white" height="50" />
</a>

<br />
<br />

**[Visit Live Site: https://drop.theatom.lk](https://drop.theatom.lk)**

</div>

<br />

> **"Copy. Download. Done."**
>
> Drop isn't just another video downloader; it's a frictionless helper for macOS.  
> Built natively in Swift and designed with Apple's aesthetic philosophy, it monitors your clipboard for video links and downloads them instantly in highest quality.

---

## 🌟 Vision

Drop's mission is to be:

- **A completely free downloading utility** — no ads, no paywalls, no limits, ever
- **A zero-friction clipboard monitor** — press `Control + D` to download copied links instantly
- **A beautiful, native desktop experience** — designed using native macOS frameworks and Apple design guidelines

---

## ✨ Why Drop?

Traditional video downloaders require opening bulky apps, pasting URLs, selecting formats, and navigating slow menus.  
Drop changes the game: copy any link, hit `⌃D`, and your video is saved to your Downloads folder immediately.

---

## 🎨 Apple-Inspired "Liquid Glass" Landing Page

- **Minimalist Aesthetics**  
  Pure CSS implementation following Apple's design principles — no frameworks, just elegance.

- **Liquid Glass Effects**  
  Translucent overlays with `backdrop-filter: blur()` create depth and focus.

- **Soft Elevation**  
  Subtle shadows and smooth transitions provide a premium, modern feel.

- **System Fonts**  
  Native `-apple-system` typography for maximum legibility and native feel.

---

## 🤖 Native Swift Engine

- **Clipboard Monitoring**  
  Efficiently listens to clipboard updates to verify video URLs.

- **Frictionless Shortcut**  
  Global keyboard shortcut `Control + D` (⌃D) works system-wide to trigger downloads.

- **Highest Quality Auto-Selection**  
  Integrates robust download logic to automatically grab the best available resolution.

- **Status Notifications**  
  Native macOS system notifications for download progress and completion.

---

## 📁 Project Structure

```
Drop/
├── Drop/                         # Native Swift macOS App source code
│   ├── Assets.xcassets           # App logos and visual assets
│   ├── AppDelegate.swift         # Core lifecycle and clipboard handler
│   └── ViewController.swift      # Status UI and settings panel
│
└── website/                      # Next.js Landing Page
    ├── public/                   # Dynamic and static assets (Logos, video demo)
    └── src/
        ├── app/
        │   ├── layout.tsx        # SEO/AEO/GEO tags, JSON-LD Schema & Analytics
        │   ├── page.tsx          # Main interactive landing page
        │   └── globals.css       # Design system and global variables
        └── components/           # UI elements & custom assets
```

---

## 🚀 Quick Start

### Prerequisites

- **macOS 15.0+** (for installing the compiled binary)
- **Xcode 16.0+** (if building from source)
- **Node.js 18+** (if running the website locally)

### 1. Clone the Repository

```bash
git clone https://github.com/zakisheriff/drop.git
cd drop
```

### 2. Download Compiled App

Get the latest build:
* Download from `https://drop.theatom.lk/build/Drop-macOS.zip`
* Unzip and move to your `/Applications` folder.

### 3. Build Web Page Locally

```bash
cd website
npm install
npm run dev
```

Visit **http://localhost:3000** 🎉

---

## 🎯 Key Features

### For Users

✅ **Instant Processing** — No manual copying & pasting into an app interface  
✅ **Highest Resolution** — Automatically downloads highest quality audio/video tracks  
✅ **Global Hotkey** — Press `Control + D` inside any application after copying a link  
✅ **Background Downloading** — Silent downloads in the background with native notification updates  
✅ **Completely Free** — No subscriptions, trackers, or hidden fees  

---

## 🔧 Tech Stack

### macOS Application
- **Swift** — Core native codebase
- **Xcode** — Native development IDE
- **AppKit** — Standard system interface design
- **yt-dlp Engine** — Reliable and updated media downloader engine

### Website Landing Page
- **Next.js** + **React.js** — Modern web application structure
- **TypeScript** — Secure, statically typed scripting
- **Pure CSS** — Framework-free, custom styled elements
- **Vercel Analytics** — Performance and user metrics integration

---

## 🔒 Security Features

✅ **Local Processing** — Zero cloud servers in the middle; downloads happen direct from source to your Mac  
✅ **Sandboxed Context** — Strict adherence to standard macOS file access permissions  
✅ **No Trackers** — Zero analytical tracking inside the desktop client  

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

## 📄 License

MIT License — 100% Free and Open Source

---

## ☕️ Support the Project

If Drop helped you grab videos efficiently or inspired your next utility project:

- Consider buying me a coffee
- It keeps development alive and motivates future updates

<div align="center">
<a href="https://buymeacoffee.com/zakisheriff">
<img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="60" width="217">
</a>
</div>

---

<p align="center">
Made by <strong>Zaki Sheriff</strong>
</p>

<p align="center">
<em>Because downloading should be free and instant for everyone.</em>
</p>
