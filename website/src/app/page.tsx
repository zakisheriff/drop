"use client";

import React from "react";
import { Download } from "lucide-react";
import styles from "./page.module.css";

export default function RootPage() {
  return (
    <div className={styles.appContainer}>
      {/* Main Showcase */}
      <main className={styles.mainViewport}>
        <div className={styles.showcaseWrapper}>
          
          {/* Spaced out blue D R O P Title */}
          <div className={styles.brandTitle}>
            <span>D</span>
            <span>R</span>
            <span>O</span>
            <span>P</span>
          </div>

          {/* Natural Video Player (Auto-looping showcase) */}
          <div className={styles.videoContainer}>
            <video
              className={styles.videoElement}
              src="/demo3.mp4"
              controls
              autoPlay
              loop
              muted
              playsInline
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
            <span className={styles.metaText}>Requires macOS 15.0+</span>
          </div>
        </div>
      </main>
    </div>
  );
}
