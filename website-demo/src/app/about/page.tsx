"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import styles from "./page.module.css";

export default function AboutPage() {
  return (
    <>
      <Navbar />
      <main>
        <section className={styles.aboutHero}>
          <div className={styles.aboutHeroContainer}>
            <h1>About Drop</h1>
            <p>We're building the simplest way to download videos on macOS</p>
          </div>
        </section>
        <section className={styles.aboutContent}>
          <div className={styles.aboutContentContainer}>
            <h2>Our Mission</h2>
            <p>Drop was created with one goal in mind: make downloading videos as simple as possible. No more copying and pasting URLs, no more complicated software.</p>
            <p>We believe that technology should make your life easier, not more complicated. That's why we built Drop to work seamlessly in the background, ready whenever you need it.</p>
          </div>
        </section>
        <section className={styles.aboutValues}>
          <div className={styles.aboutValuesContainer}>
            <h2>Our Values</h2>
            <div className={styles.valuesGrid}>
              <div className={styles.valueItem}>
                <h3>Simplicity</h3>
                <p>We believe in keeping things simple. Drop does one thing and does it well.</p>
              </div>
              <div className={styles.valueItem}>
                <h3>Quality</h3>
                <p>We never compromise on quality. Drop downloads videos in the highest available resolution.</p>
              </div>
              <div className={styles.valueItem}>
                <h3>Privacy</h3>
                <p>Your data stays on your device. Drop doesn't collect or share any personal information.</p>
              </div>
            </div>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
