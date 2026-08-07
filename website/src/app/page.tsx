"use client";

import React, { useState } from "react";
import Navbar from "@/components/Navbar";
import Sidebar from "@/components/Sidebar";
import AppMockup from "@/components/AppMockup";
import BlogSection from "@/components/BlogSection";
import { Download, Globe, Terminal } from "lucide-react";
import styles from "./page.module.css";

export default function RootPage() {
  const [sidebarOpen, setSidebarOpen] = useState(true);
  const [activeSection, setActiveSection] = useState<"home" | "blog">("home");
  const [mockUrl, setMockUrl] = useState("");
  const [searchTriggerUrl, setSearchTriggerUrl] = useState("");

  const handleSearch = (url: string) => {
    setSearchTriggerUrl(url);
  };

  const handleClearTrigger = () => {
    setSearchTriggerUrl("");
  };

  return (
    <div className={styles.appContainer}>
      {/* Top Navbar */}
      <Navbar
        sidebarOpen={sidebarOpen}
        setSidebarOpen={setSidebarOpen}
        mockUrl={mockUrl}
        setMockUrl={setMockUrl}
        onSearch={handleSearch}
      />

      {/* Content wrapper */}
      <div className={styles.contentWrapper}>
        {/* Left Sidebar */}
        <Sidebar
          sidebarOpen={sidebarOpen}
          activeSection={activeSection}
          setActiveSection={setActiveSection}
        />

        {/* Main Viewport */}
        <main className={styles.mainViewport}>
          {activeSection === "home" ? (
            <div className={styles.landingLayout}>
              {/* Left Side: Hero Info */}
              <div className={styles.heroContent}>
                <div className={styles.shortcutBadge}>
                  <Terminal size={14} />
                  <span>Shortcut Enabled:</span>
                  <span className={styles.keycap}>⌃D</span>
                </div>
                <h1 className={styles.heroTitle}>
                  Copy. Download. Done.
                </h1>
                <p className={styles.heroSubtitle}>
                  A native macOS utility that monitors your clipboard for video links and downloads them instantly in highest quality. Fully backed by yt-dlp & ffmpeg.
                </p>

                <div style={{ display: "flex", flexDirection: "column", gap: "10px", margin: "10px 0" }}>
                  <div style={{ display: "flex", alignItems: "center", gap: "10px", color: "#ddd", fontSize: "0.9rem" }}>
                    <div style={{ width: "6px", height: "6px", backgroundColor: "#ff3b30", borderRadius: "50%" }}></div>
                    <span>No browser extension needed</span>
                  </div>
                  <div style={{ display: "flex", alignItems: "center", gap: "10px", color: "#ddd", fontSize: "0.9rem" }}>
                    <div style={{ width: "6px", height: "6px", backgroundColor: "#ff9500", borderRadius: "50%" }}></div>
                    <span>Automated format & stream merging (ffmpeg)</span>
                  </div>
                  <div style={{ display: "flex", alignItems: "center", gap: "10px", color: "#ddd", fontSize: "0.9rem" }}>
                    <div style={{ width: "6px", height: "6px", backgroundColor: "#34c759", borderRadius: "50%" }}></div>
                    <span>Runs silently in the status menu bar</span>
                  </div>
                </div>

                <div className={styles.downloadActions}>
                  <a href="/build/Drop-macOS.zip" download className="btn-primary">
                    <Download size={18} />
                    <span>Download for macOS</span>
                  </a>
                  <button
                    onClick={() => setActiveSection("blog")}
                    className="btn-secondary"
                  >
                    <Globe size={18} />
                    <span>Learn More</span>
                  </button>
                </div>
                <span className={styles.versionText}>Requires macOS 15.0 or later • v1.0.0</span>
              </div>

              {/* Right Side: Interactive Mockup */}
              <div className={styles.mockupContainer}>
                <AppMockup
                  initialUrl={searchTriggerUrl}
                  onClearInitialUrl={handleClearTrigger}
                />
              </div>
            </div>
          ) : (
            <BlogSection />
          )}
        </main>
      </div>
    </div>
  );
}
