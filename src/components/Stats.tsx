"use client";

import React from "react";

const stats = [
  { value: "10K+", label: "Downloads" },
  { value: "4.9", label: "Rating" },
  { value: "50+", label: "Supported Sites" },
  { value: "100%", label: "Free" },
];

export default function Stats() {
  return (
    <section className="stats">
      <div className="stats-container">
        <div className="stats-grid">
          {stats.map((stat, index) => (
            <div key={index} className="stat-item">
              <span className="stat-value">{stat.value}</span>
              <span className="stat-label">{stat.label}</span>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
