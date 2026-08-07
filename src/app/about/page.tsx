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
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
