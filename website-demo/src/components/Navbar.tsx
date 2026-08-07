"use client";

import React, { useState } from "react";
import Link from "next/link";
import styles from "./Navbar.module.css";

export default function Navbar() {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  return (
    <nav className={styles.navbar}>
      <div className={styles.navbarContainer}>
        <div className={styles.navbarLogo}>
          <Link href="/">
            <span className={styles.logoText}>DROP</span>
          </Link>
        </div>
        <button 
          className={styles.mobileMenuBtn}
          onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
        >
          ☰
        </button>
        <div className={styles.navbarLinks}>
          <Link href="/" className={styles.navLink}>Home</Link>
          <Link href="/about" className={styles.navLink}>About</Link>
          <Link href="/features" className={styles.navLink}>Features</Link>
          <Link href="/download" className={styles.navLink}>Download</Link>
          <Link href="/blog" className={styles.navLink}>Blog</Link>
          <Link href="/contact" className={styles.navLink}>Contact</Link>
        </div>
      </div>
    </nav>
  );
}
