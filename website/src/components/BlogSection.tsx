"use client";

import React, { useState } from "react";
import { Calendar, User, ArrowLeft } from "lucide-react";
import styles from "../app/page.module.css";

interface BlogArticle {
  id: string;
  title: string;
  date: string;
  author: string;
  snippet: string;
  content: React.ReactNode;
}

export default function BlogSection() {
  const [selectedArticleId, setSelectedArticleId] = useState("clipboard");
  const [mobileActive, setMobileActive] = useState(false);

  const articles: BlogArticle[] = [
    {
      id: "clipboard",
      title: "Why Clipboard Monitoring is the Ultimate Downloader Interface",
      date: "August 6, 2026",
      author: "Afraa Sheriff",
      snippet: "Discover why watching pasteboard changes directly in macOS is a faster, more elegant alternative to traditional browser extensions.",
      content: (
        <>
          <p>
            Traditional video downloaders make you install heavy, permission-hungry browser extensions or manually copy-paste links into a clunky text field. With Drop, we took a different design approach: <strong>Zero UI footprint, native pasteboard polling.</strong>
          </p>
          <h2>How it Works without Lag</h2>
          <p>
            Many developers worry that clipboard monitors will drain battery or slow down their system. Drop solves this by polling the macOS pasteboard&apos;s <code>changeCount</code> rather than constantly reading the clipboard content itself.
          </p>
          <p>
            The <code>changeCount</code> is an integer maintained directly by the system. Checking it takes less than 1 microsecond. Only when the count increments does Drop inspect the contents to see if a URL is present.
          </p>
          <h2>The Control + D Flow</h2>
          <p>
            When a URL changes, Drop automatically queries <code>yt-dlp</code> in the background. If the link is supported:
          </p>
          <ul>
            <li>Drop posts a native macOS notification with action buttons.</li>
            <li>The Dock icon badge increments.</li>
            <li>Pressing the global shortcut <code>Control + D</code> downloads it instantly to your pre-configured location in the highest quality.</li>
          </ul>
          <p>
            This integration feels like a native extension of the macOS operating system rather than a separate utility app.
          </p>
        </>
      ),
    },
    {
      id: "ytdlp-ffmpeg",
      title: "Under the Hood: Native Video Resolution Parsing with yt-dlp & ffmpeg",
      date: "August 2, 2026",
      author: "Drop Engineering",
      snippet: "How Drop leverages yt-dlp's single JSON output and ffmpeg's container merging to download 4K video natively.",
      content: (
        <>
          <p>
            Drop is built to support any website. To do this, we do not hardcode URL structures or site support. Instead, we query <code>yt-dlp</code> itself.
          </p>
          <h2>Dynamic Format Validation</h2>
          <p>
            When a video link is detected, Drop fires an asynchronous shell command:
          </p>
          <pre style={{ backgroundColor: "#1e1e1e", padding: "12px", borderRadius: "6px", fontFamily: "monospace", margin: "12px 0", fontSize: "0.85rem", overflowX: "auto" }}>
            yt-dlp --simulate --dump-single-json &quot;[url]&quot;
          </pre>
          <p>
            This call serves two purposes. First, it verifies if <code>yt-dlp</code> can actually download from the URL. Second, it returns a complete JSON object detailing all the formats and resolutions available (e.g. 4320p, 2160p HDR, 1080p, 720p).
          </p>
          <h2>Seamless Remuxing with ffmpeg</h2>
          <p>
            Many video platforms serve high-definition streams (1080p and above) as separate video and audio tracks. To merge them, Drop detects if <code>ffmpeg</code> is installed on the user&apos;s system:
          </p>
          <ul>
            <li>If <code>ffmpeg</code> is found, it downloads the best quality video track and the best audio track, then merges them into a clean <code>mp4</code> file.</li>
            <li>If it is missing, it alerts the user and falls back to pre-merged streams to ensure a working download.</li>
          </ul>
          <p>
            All configuration is handled automatically in the background, keeping the user experience simple.
          </p>
        </>
      ),
    },
    {
      id: "swift-processes",
      title: "Swift Execution: Running Child Processes Safely and Efficiently on macOS",
      date: "July 28, 2026",
      author: "Swift Architect",
      snippet: "A deep dive into managing external CLI wrappers inside macOS native apps using Swift's Process class.",
      content: (
        <>
          <p>
            Since Drop executes <code>yt-dlp</code> and <code>ffmpeg</code> from paths like Homebrew or MacPorts, it runs unsandboxed. This allows launching external binaries, which the strict App Sandbox restricts.
          </p>
          <h2>Parsing Stdout in Real Time</h2>
          <p>
            Instead of scraping terminal text, Drop reads stdout pipes using standard macOS APIs. We look for specific patterns using a Custom Progress Parser:
          </p>
          <ul>
            <li>We parse actual byte counts to display precise progress bars.</li>
            <li>We capture speed figures (e.g. <code>42.5 MB/s</code>) and ETA dynamically.</li>
            <li>If the user clicks cancel, we send a termination signal directly to the child process PID, cleaning up unfinished temp files cleanly.</li>
          </ul>
          <h2>Launch at Login</h2>
          <p>
            To keep the clipboard monitor active continuously, Drop integrates macOS&apos;s <code>SMAppService</code>. This enables adding Drop to the system login items safely, ensuring it loads as soon as your Mac boots up.
          </p>
        </>
      ),
    },
  ];

  const currentArticle = articles.find((a) => a.id === selectedArticleId) || articles[0];

  const handleSelectArticle = (id: string) => {
    setSelectedArticleId(id);
    setMobileActive(true);
  };

  return (
    <div className={styles.blogContainer}>
      {/* Blog Cards List */}
      <div className={styles.blogListPane}>
        <h2 className={styles.blogListHeader}>App Journals</h2>
        {articles.map((article) => (
          <div
            key={article.id}
            onClick={() => handleSelectArticle(article.id)}
            className={`${styles.blogCard} ${
              selectedArticleId === article.id ? styles.blogCardActive : ""
            }`}
          >
            <span className={styles.blogCardDate}>{article.date}</span>
            <h3 className={styles.blogCardTitle}>{article.title}</h3>
            <p className={styles.blogCardSnippet}>{article.snippet}</p>
          </div>
        ))}
      </div>

      {/* Reading pane */}
      <div
        className={`${styles.blogReadingPane} ${
          mobileActive ? styles.activeMobile : ""
        }`}
      >
        <button
          onClick={() => setMobileActive(false)}
          className={styles.mobileBackButton}
        >
          <ArrowLeft size={16} />
          <span>Back to Articles</span>
        </button>

        <article className={styles.blogArticle}>
          <div className={styles.blogMeta}>
            <span style={{ display: "flex", alignItems: "center", gap: "4px" }}>
              <Calendar size={14} />
              {currentArticle.date}
            </span>
            <span>•</span>
            <span style={{ display: "flex", alignItems: "center", gap: "4px" }}>
              <User size={14} />
              By {currentArticle.author}
            </span>
          </div>
          <h1 className={styles.blogArticleTitle}>{currentArticle.title}</h1>
          <div className={styles.blogContent}>{currentArticle.content}</div>
        </article>
      </div>
    </div>
  );
}
