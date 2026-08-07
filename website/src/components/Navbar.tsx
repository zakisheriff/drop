"use client";

import React from "react";
import Link from "next/link";
import { Menu, Download } from "lucide-react";
import styles from "../app/page.module.css";

const GithubIcon = ({ size = 20 }: { size?: number }) => (
  <svg
    viewBox="0 0 24 24"
    width={size}
    height={size}
    stroke="currentColor"
    strokeWidth="2"
    fill="none"
    strokeLinecap="round"
    strokeLinejoin="round"
  >
    <path d="M15 22v-4a4.8 4.8 0 0 0-1-3.5c3 0 6-2 6-5.5.08-1.25-.27-2.48-1-3.5.28-1.15.28-2.35 0-3.5 0 0-1 0-3 1.5-2.64-.5-5.36-.5-8 0C6 2 5 2 5 2c-.3 1.15-.3 2.35 0 3.5A5.403 5.403 0 0 0 4 9c0 3.5 3 5.5 6 5.5-.39.49-.68 1.05-.85 1.65-.17.6-.22 1.23-.15 1.85v4" />
    <path d="M9 18c-4.51 2-5-2-7-2" />
  </svg>
);

interface NavbarProps {
  sidebarOpen: boolean;
  setSidebarOpen: (open: boolean) => void;
  mockUrl: string;
  setMockUrl: (url: string) => void;
  onSearch: (url: string) => void;
}

export default function Navbar({
  sidebarOpen,
  setSidebarOpen,
  mockUrl,
  setMockUrl,
  onSearch,
}: NavbarProps) {
  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (mockUrl.trim()) {
      onSearch(mockUrl);
    }
  };

  return (
    <nav className={styles.navbar}>
      <div className={styles.navLeft}>
        <button
          onClick={() => setSidebarOpen(!sidebarOpen)}
          className={styles.menuButton}
          aria-label="Toggle navigation drawer"
        >
          <Menu size={20} />
        </button>
        <Link href="/" className={styles.logo}>
          <div className={styles.logoIcon}>D</div>
          <span className={styles.logoText}>Drop</span>
          <span className={styles.logoBadge}>macOS</span>
        </Link>
      </div>

      <div className={styles.navCenter}>
        <form onSubmit={handleSubmit} className={styles.searchContainer}>
          <input
            type="text"
            className={styles.searchInput}
            placeholder="Paste video link here to test Drop..."
            value={mockUrl}
            onChange={(e) => setMockUrl(e.target.value)}
          />
          <button type="submit" className={styles.searchButton} aria-label="Search">
            <span style={{ fontSize: "0.85rem", fontWeight: 600 }}>Paste</span>
          </button>
        </form>
      </div>

      <div className={styles.navRight}>
        <a
          href="https://github.com/afraasheriff/drop"
          target="_blank"
          rel="noopener noreferrer"
          className={styles.githubLink}
          title="View source on GitHub"
        >
          <GithubIcon size={20} />
        </a>
        <a
          href="/build/Drop-macOS.zip"
          download
          className="btn-primary"
          style={{ padding: "8px 16px", fontSize: "0.8rem" }}
        >
          <Download size={14} />
          <span>Download App</span>
        </a>
      </div>
    </nav>
  );
}
