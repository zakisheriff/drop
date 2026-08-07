"use client";

import React, { useState, useEffect, useRef } from "react";
import { Download, RefreshCw, Clipboard } from "lucide-react";
import styles from "../app/page.module.css";

interface AppMockupProps {
  initialUrl: string;
  onClearInitialUrl: () => void;
}

export default function AppMockup({ initialUrl, onClearInitialUrl }: AppMockupProps) {
  const [url, setUrl] = useState("");
  const [format, setFormat] = useState("highest");
  const [downloadState, setDownloadState] = useState<"idle" | "validating" | "ready" | "downloading" | "completed">("idle");
  const [progress, setProgress] = useState(0);
  const [speed, setSpeed] = useState("0 MB/s");
  const [eta, setEta] = useState("0s");
  const [downloadedSize, setDownloadedSize] = useState("0 MB");
  const [videoTitle, setVideoTitle] = useState("");
  const progressTimerRef = useRef<NodeJS.Timeout | null>(null);

  const handleValidateLink = (linkStr: string) => {
    if (!linkStr) return;
    setDownloadState("validating");
    setProgress(0);

    // Simulate link validation (similar to yt-dlp simulation in the Swift app)
    setTimeout(() => {
      let title = "Awesome Video Clip";
      if (linkStr.includes("youtube.com") || linkStr.includes("youtu.be")) {
        title = "Never Gonna Give You Up (4K HDR)";
      } else if (linkStr.includes("vimeo.com")) {
        title = "Cinematic Drone Reel 2026";
      } else if (linkStr.includes("twitter.com") || linkStr.includes("x.com")) {
        title = "Trending Tech Showcase Tweet Video";
      }

      setVideoTitle(title);
      setDownloadState("ready");
    }, 1200);
  };

  // Sync from Navbar search bar
  useEffect(() => {
    if (initialUrl) {
      const timer = setTimeout(() => {
        setUrl(initialUrl);
        handleValidateLink(initialUrl);
        onClearInitialUrl();
      }, 0);
      return () => clearTimeout(timer);
    }
  }, [initialUrl, onClearInitialUrl]);

  const handlePasteDemo = () => {
    const demoUrl = "https://www.youtube.com/watch?v=dQw4w9WgXcQ";
    setUrl(demoUrl);
    handleValidateLink(demoUrl);
  };

  const handleStartDownload = () => {
    if (downloadState !== "ready") return;
    setDownloadState("downloading");
    setProgress(0);
    setSpeed("32.4 MB/s");
    setEta("4s");

    let currentProgress = 0;
    const totalSize = format.includes("audio") ? 4.8 : 42.6; // MB

    progressTimerRef.current = setInterval(() => {
      currentProgress += Math.random() * 8 + 3;
      if (currentProgress >= 100) {
        currentProgress = 100;
        if (progressTimerRef.current) clearInterval(progressTimerRef.current);
        setDownloadState("completed");
        setSpeed("0 MB/s");
        setEta("0s");
        setDownloadedSize(`${totalSize.toFixed(1)} MB`);
      } else {
        setProgress(currentProgress);
        // Vary speed slightly
        const randomSpeed = (30 + Math.random() * 8).toFixed(1);
        setSpeed(`${randomSpeed} MB/s`);
        // Calculate dynamic ETA
        const remainingSeconds = Math.ceil((100 - currentProgress) / 25);
        setEta(`${remainingSeconds}s`);
        // Download size
        const currentSize = (totalSize * (currentProgress / 100)).toFixed(1);
        setDownloadedSize(`${currentSize} / ${totalSize.toFixed(1)} MB`);
      }
    }, 150);
  };

  const handleReset = () => {
    setUrl("");
    setVideoTitle("");
    setProgress(0);
    setDownloadState("idle");
    if (progressTimerRef.current) clearInterval(progressTimerRef.current);
  };

  useEffect(() => {
    return () => {
      if (progressTimerRef.current) clearInterval(progressTimerRef.current);
    };
  }, []);

  return (
    <div className={styles.macAppWindow}>
      {/* Titlebar */}
      <div className={styles.macTitlebar}>
        <div className={styles.windowControls}>
          <div className={`${styles.dot} ${styles.dotClose}`}></div>
          <div className={`${styles.dot} ${styles.dotMinimize}`}></div>
          <div className={`${styles.dot} ${styles.dotMaximize}`}></div>
        </div>
        <div className={styles.windowTitle}>Drop</div>
      </div>

      {/* Main Content Area */}
      <div className={styles.macAppContent}>
        {/* Input section */}
        <div className={styles.macInputSection}>
          <div className={styles.macLabel}>VIDEO LINK SOURCE</div>
          <div className={styles.macInputWrapper}>
            <input
              type="text"
              className={styles.macInput}
              placeholder="Waiting for clipboard link..."
              value={url}
              onChange={(e) => {
                setUrl(e.target.value);
                if (e.target.value === "") {
                  handleReset();
                }
              }}
              disabled={downloadState === "downloading"}
            />
            {url === "" && (
              <button onClick={handlePasteDemo} className={styles.macClipboardButton}>
                <Clipboard size={12} style={{ marginRight: "4px" }} />
                Paste Demo
              </button>
            )}
          </div>
        </div>

        {/* Format Select & Download Trigger */}
        <div className={styles.macMiddleRow}>
          <select
            className={styles.macSelect}
            value={format}
            onChange={(e) => setFormat(e.target.value)}
            disabled={downloadState === "downloading" || downloadState === "idle" || downloadState === "validating"}
          >
            <option value="highest">Highest (2160p)</option>
            <option value="1080p">High (1080p)</option>
            <option value="720p">Medium (720p)</option>
            <option value="audio-m4a">Audio M4A</option>
            <option value="audio-mp3">Audio MP3</option>
          </select>

          {downloadState === "completed" ? (
            <button onClick={handleReset} className={styles.macDownloadBtn}>
              <RefreshCw size={12} style={{ marginRight: "4px" }} />
              Reset Demo
            </button>
          ) : (
            <button
              onClick={
                downloadState === "idle"
                  ? () => handleValidateLink(url)
                  : handleStartDownload
              }
              className={styles.macDownloadBtn}
              disabled={!url || downloadState === "validating" || downloadState === "downloading"}
            >
              <Download size={12} style={{ marginRight: "4px" }} />
              {downloadState === "idle" && "Validate"}
              {downloadState === "validating" && "Checking..."}
              {downloadState === "ready" && "Download"}
              {downloadState === "downloading" && "Downloading..."}
            </button>
          )}
        </div>

        {/* Status display */}
        <div className={styles.macStatusBox}>
          {downloadState === "idle" && (
            <p className={styles.statusText}>
              Copy any video link and run the app or press the button above to simulate.
            </p>
          )}

          {downloadState === "validating" && (
            <p className={styles.statusText}>
              Running: <code style={{ color: "#fff" }}>yt-dlp --simulate --dump-single-json</code>...
            </p>
          )}

          {downloadState === "ready" && (
            <div style={{ textAlign: "center" }}>
              <p style={{ fontWeight: 600, color: "#fff", marginBottom: "4px" }}>
                ✓ {videoTitle}
              </p>
              <p className={styles.statusText} style={{ fontSize: "0.7rem" }}>
                Ready to download. Choose format and click Download.
              </p>
            </div>
          )}

          {downloadState === "downloading" && (
            <div className={styles.downloadActiveContent}>
              <div className={styles.videoTitleRow}>
                <span className={styles.videoTitle}>{videoTitle}</span>
                <span className={styles.videoSize}>{downloadedSize}</span>
              </div>
              <div className={styles.progressBarContainer}>
                <div
                  className={styles.progressBarFill}
                  style={{ width: `${progress}%` }}
                ></div>
              </div>
              <div className={styles.progressDetailRow}>
                <span>Speed: {speed}</span>
                <span>Progress: {Math.round(progress)}%</span>
                <span>ETA: {eta}</span>
              </div>
            </div>
          )}

          {downloadState === "completed" && (
            <div style={{ textAlign: "center" }}>
              <p style={{ fontWeight: 700, color: "#30d158", marginBottom: "4px" }}>
                🎉 Download Complete!
              </p>
              <p className={styles.statusText}>
                File saved to your output directory ({downloadedSize}).
              </p>
            </div>
          )}
        </div>
      </div>

      {/* Footer / Statusbar */}
      <div className={styles.macFooter}>
        <span style={{ marginRight: "auto" }}>
          {downloadState === "downloading" ? "Downloading..." : "Watching pasteboard"}
        </span>
        <span>yt-dlp active</span>
      </div>
    </div>
  );
}
