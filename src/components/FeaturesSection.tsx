"use client";

import React from "react";
import FeatureCard from "./FeatureCard";

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
];

export default function FeaturesSection() {
  return (
    <section className="features">
      <div className="features-container">
        <div className="features-header">
          <h2 className="features-title">Features</h2>
          <p className="features-subtitle">Everything you need to download videos instantly</p>
        </div>
        <div className="features-grid">
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
