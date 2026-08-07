"use client";

import React from "react";
import styles from "./Stats.module.css";

const stats = [
  { value: "10K+", label: "Downloads" },
  { value: "4.9", label: "Rating" },
  { value: "50+", label: "Supported Sites" },
  { value: "100%", label: "Free" },
];

export default function Stats() {
  return (
    <section className={styles.stats}>
      <div className={styles.statsContainer}>
        <div className={styles.statsGrid}>
          {stats.map((stat, index) => (
            <div key={index} className={styles.statItem}>
              <span className={styles.statValue}>{stat.value}</span>
              <span className={styles.statLabel}>{stat.label}</span>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
