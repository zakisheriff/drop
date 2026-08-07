"use client";

import React from "react";
import FeatureCard from "./FeatureCard";
import styles from "./FeaturesSection.module.css";

const features = [
  {
    icon: "⚡",
    title: "Instant Downloads",
    description: "Download videos instantly with a single keyboard shortcut. No more copy-pasting URLs.",
  },
  {
    icon: "🎯",
    title: "Smart Detection",
    description: "Automatically detects video links in your clipboard and prepares them for download.",
  },
  {
    icon: "✨",
    title: "Highest Quality",
    description: "Downloads videos in the highest available quality, up to 4K resolution.",
  },
  {
    icon: "🔒",
    title: "Privacy First",
    description: "Your data stays on your device. We don't collect or share any personal information.",
  },
  {
    icon: "🌐",
    title: "Wide Support",
    description: "Supports over 50 popular video sites including YouTube, Vimeo, and more.",
  },
  {
    icon: "📱",
    title: "Lightweight",
    description: "Minimal resource usage. Drop runs silently in the background without slowing down your Mac.",
  },
];

export default function FeaturesSection() {
  return (
    <section className={styles.features}>
      <div className={styles.featuresContainer}>
        <div className={styles.featuresHeader}>
          <h2 className={styles.featuresTitle}>Features</h2>
          <p className={styles.featuresSubtitle}>Everything you need to download videos instantly</p>
        </div>
        <div className={styles.featuresGrid}>
          {features.map((feature, index) => (
            <FeatureCard
              key={index}
              icon={feature.icon}
              title={feature.title}
              description={feature.description}
            />
          ))}
        </div>
      </div>
    </section>
  );
}
