"use client";

import React from "react";
import styles from "./CTASection.module.css";

export default function CTASection() {
  return (
    <section className={styles.cta}>
      <div className={styles.ctaContainer}>
        <div className={styles.ctaContent}>
          <h2 className={styles.ctaTitle}>Start downloading videos today</h2>
          <p className={styles.ctaSubtitle}>Join thousands of users who already use Drop</p>
          <button className="btn-primary">Download for macOS</button>
        </div>
      </div>
    </section>
  );
}
