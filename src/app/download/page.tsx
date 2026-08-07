"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import DownloadSection from "@/components/DownloadSection";
import Footer from "@/components/Footer";
import styles from "./page.module.css";

export default function DownloadPage() {
  return (
    <>
      <Navbar />
      <main>
        <section className={styles.downloadHero}>
          <div className={styles.downloadHeroContainer}>
            <h1>Download Drop</h1>
            <p>Get started with Drop for macOS</p>
          </div>
        </section>
        <DownloadSection />
        <section className={styles.downloadFeatures}>
          <div className={styles.downloadFeaturesContainer}>
            <h2>What's Included</h2>
            <div className={styles.downloadFeaturesGrid}>
              <div className={styles.downloadFeatureItem}>
                <span className={styles.checkmark}>✓</span>
                <span>Free forever</span>
              </div>
              <div className={styles.downloadFeatureItem}>
                <span className={styles.checkmark}>✓</span>
                <span>No ads</span>
              </div>
              <div className={styles.downloadFeatureItem}>
                <span className={styles.checkmark}>✓</span>
                <span>Regular updates</span>
              </div>
              <div className={styles.downloadFeatureItem}>
                <span className={styles.checkmark}>✓</span>
                <span>50+ supported sites</span>
              </div>
            </div>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
