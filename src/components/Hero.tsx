"use client";

import React from "react";

export default function Hero() {
  return (
    <section className="hero">
      <div className="hero-container">
        <div className="hero-content">
          <div className="hero-badge">
            <span>New Release</span>
          </div>
          <h1 className="hero-title">
            Copy. Download. Done.
          </h1>
          <p className="hero-subtitle">
            A native macOS utility that monitors your clipboard for video links and downloads them instantly.
          </p>
          <div className="hero-cta">
            <button className="btn-primary">
              Download for macOS
            </button>
            <button className="btn-secondary">
              Learn More
            </button>
          </div>
          <div className="hero-info">
            <span className="hero-info-text">Press</span>
            <span className="hero-keycap">⌃D</span>
            <span className="hero-info-text">to download instantly</span>
          </div>
        </div>
      </div>
    </section>
  );
}
