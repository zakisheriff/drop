"use client";

import React from "react";
import styles from "./Hero.module.css";

export default function Hero() {
  return (
    <section className={styles.hero}>
      <div className={styles.heroContainer}>
        <div className={styles.heroContent}>
          <div className={styles.heroBadge}>
            <span>New Release</span>
          </div>
          <h1 className={styles.heroTitle}>
            <span className={styles.heroTitleGradient}>Copy. Download. Done.</span>
          </h1>
          <p className={styles.heroSubtitle}>
            A native macOS utility that monitors your clipboard for video links and downloads them instantly.
          </p>
          <div className={styles.heroCta}>
            <button className="btn-primary">
              Download for macOS
            </button>
            <button className="btn-secondary">
              Learn More
            </button>
          </div>
          <div className={styles.heroInfo}>
            <span className={styles.heroInfoText}>Press</span>
            <span className={styles.heroKeycap}>⌃D</span>
            <span className={styles.heroInfoText}>to download instantly</span>
          </div>
          <span className={styles.heroRequirements}>Requires macOS 15.0+</span>
        </div>
      </div>
    </section>
  );
}
