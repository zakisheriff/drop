"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import FeaturesSection from "@/components/FeaturesSection";
import Footer from "@/components/Footer";
import styles from "./page.module.css";

export default function FeaturesPage() {
  return (
    <>
      <Navbar />
      <main>
        <section className={styles.featuresHero}>
          <div className={styles.featuresHeroContainer}>
            <h1>Features</h1>
            <p>Everything you need to download videos instantly</p>
          </div>
        </section>
        <FeaturesSection />
        <section className={styles.featuresExtra}>
          <div className={styles.featuresExtraContainer}>
            <h2>Why Choose Drop?</h2>
            <div className={styles.extraGrid}>
              <div className={styles.extraItem}>
                <h3>Fast</h3>
                <p>Downloads start instantly with no delays.</p>
              </div>
              <div className={styles.extraItem}>
                <h3>Simple</h3>
                <p>One shortcut to download any video.</p>
              </div>
              <div className={styles.extraItem}>
                <h3>Reliable</h3>
                <p>Works every time, no exceptions.</p>
              </div>
            </div>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
