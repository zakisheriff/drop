"use client";

import Image from "next/image";
import { Download } from "lucide-react";
import styles from "./page.module.css";

const GithubIcon = ({ size = 20 }: { size?: number }) => (
  <svg
    viewBox="0 0 24 24"
    width={size}
    height={size}
    stroke="currentColor"
    strokeWidth="2"
    fill="none"
    strokeLinecap="round"
    strokeLinejoin="round"
  >
    <path d="M15 22v-4a4.8 4.8 0 0 0-1-3.5c3 0 6-2 6-5.5.08-1.25-.27-2.48-1-3.5.28-1.15.28-2.35 0-3.5 0 0-1 0-3 1.5-2.64-.5-5.36-.5-8 0C6 2 5 2 5 2c-.3 1.15-.3 2.35 0 3.5A5.403 5.403 0 0 0 4 9c0 3.5 3 5.5 6 5.5-.39.49-.68 1.05-.85 1.65-.17.6-.22 1.23-.15 1.85v4" />
    <path d="M9 18c-4.51 2-5-2-7-2" />
  </svg>
);

export default function RootPage() {
  return (
    <div className={styles.appContainer}>
      {/* Top Header Bar */}
      <header className={styles.navbar}>
        <a href="#" className={styles.logo} onClick={(e) => e.preventDefault()}>
          <Image
            src="/logo-drop.png"
            alt="Drop Logo"
            className={styles.logoIcon}
            width={28}
            height={28}
            priority
          />
          <span className={styles.logoText}>Drop</span>
          <span className={styles.logoBadge}>macOS</span>
        </a>

        <div className={styles.navRight}>
          <a
            href="https://github.com/afraasheriff/drop"
            target="_blank"
            rel="noopener noreferrer"
            className={styles.githubLink}
            title="View source on GitHub"
          >
            <GithubIcon size={20} />
          </a>
        </div>
      </header>

      {/* Main Showcase */}
      <main className={styles.mainViewport}>
        <div className={styles.showcaseWrapper}>
          {/* 16:9 Video Player */}
          <div className={styles.videoContainer}>
            <video
              className={styles.videoElement}
              src="/drop-demo.mp4"
              controls
              poster="/logo-drop.png" // Fallback thumbnail is the logo
              preload="metadata"
            >
              Your browser does not support the video tag.
            </video>
          </div>

          {/* Download Action and Keycap */}
          <div className={styles.actionArea}>
            <a href="/build/Drop-macOS.zip" download className="btn-primary">
              <Download size={18} />
              <span>Download for macOS</span>
            </a>
            <div className={styles.shortcutInfo}>
              <span>Press</span>
              <span className={styles.keycap}>⌃D</span>
              <span>to copy and download instantly</span>
            </div>
            <span className={styles.metaText}>Requires macOS 15.0+ • v1.0.0</span>
          </div>
        </div>
      </main>
    </div>
  );
}
