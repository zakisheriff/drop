#!/bin/bash
cd /Users/afraasheriff/Desktop/The_Atom/Atom-Originals/drop/website-demo

# ============================================
# PHASE 7: DownloadSection & Footer (commits 110-160)
# ============================================

# Commit 110: Create DownloadSection.tsx
cat > src/components/DownloadSection.tsx << 'EOF'
"use client";

import React from "react";
EOF
git add src/components/DownloadSection.tsx && git commit -m "feat: create DownloadSection component file"

# Commit 111: Add DownloadSection function
cat > src/components/DownloadSection.tsx << 'EOF'
"use client";

import React from "react";

export default function DownloadSection() {
  return (
    <section className="download">
    </section>
  );
}
EOF
git add src/components/DownloadSection.tsx && git commit -m "feat: add DownloadSection function component"

# Commit 112: Add download container
cat > src/components/DownloadSection.tsx << 'EOF'
"use client";

import React from "react";

export default function DownloadSection() {
  return (
    <section className="download">
      <div className="download-container">
      </div>
    </section>
  );
}
EOF
git add src/components/DownloadSection.tsx && git commit -m "style: add download container div"

# Commit 113: Add download content
cat > src/components/DownloadSection.tsx << 'EOF'
"use client";

import React from "react";

export default function DownloadSection() {
  return (
    <section className="download">
      <div className="download-container">
        <div className="download-content">
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/DownloadSection.tsx && git commit -m "style: add download content wrapper"

# Commit 114: Add download title
cat > src/components/DownloadSection.tsx << 'EOF'
"use client";

import React from "react";

export default function DownloadSection() {
  return (
    <section className="download">
      <div className="download-container">
        <div className="download-content">
          <h2 className="download-title">Ready to get started?</h2>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/DownloadSection.tsx && git commit -m "feat: add download section title"

# Commit 115: Add download subtitle
cat > src/components/DownloadSection.tsx << 'EOF'
"use client";

import React from "react";

export default function DownloadSection() {
  return (
    <section className="download">
      <div className="download-container">
        <div className="download-content">
          <h2 className="download-title">Ready to get started?</h2>
          <p className="download-subtitle">Download Drop for macOS and start downloading videos instantly</p>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/DownloadSection.tsx && git commit -m "feat: add download section subtitle"

# Commit 116: Add download button
cat > src/components/DownloadSection.tsx << 'EOF'
"use client";

import React from "react";

export default function DownloadSection() {
  return (
    <section className="download">
      <div className="download-container">
        <div className="download-content">
          <h2 className="download-title">Ready to get started?</h2>
          <p className="download-subtitle">Download Drop for macOS and start downloading videos instantly</p>
          <button className="btn-primary">
            Download for macOS
          </button>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/DownloadSection.tsx && git commit -m "feat: add download button"

# Commit 117: Add download version info
cat > src/components/DownloadSection.tsx << 'EOF'
"use client";

import React from "react";

export default function DownloadSection() {
  return (
    <section className="download">
      <div className="download-container">
        <div className="download-content">
          <h2 className="download-title">Ready to get started?</h2>
          <p className="download-subtitle">Download Drop for macOS and start downloading videos instantly</p>
          <button className="btn-primary">
            Download for macOS
          </button>
          <span className="download-version">Version 1.0.0 • macOS 15.0+</span>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/DownloadSection.tsx && git commit -m "feat: add download version info text"

# Commit 118: Create DownloadSection.module.css
cat > src/components/DownloadSection.module.css << 'EOF'
.download {
  padding: 120px 24px;
  text-align: center;
}
EOF
git add src/components/DownloadSection.module.css && git commit -m "style: create DownloadSection.module.css"

# Commit 119: Add download container styles
cat > src/components/DownloadSection.module.css << 'EOF'
.download {
  padding: 120px 24px;
  text-align: center;
}

.download-container {
  max-width: 800px;
  margin: 0 auto;
}
EOF
git add src/components/DownloadSection.module.css && git commit -m "style: add download container max-width"

# Commit 120: Add download content styles
cat > src/components/DownloadSection.module.css << 'EOF'
.download {
  padding: 120px 24px;
  text-align: center;
}

.download-container {
  max-width: 800px;
  margin: 0 auto;
}

.download-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 24px;
}
EOF
git add src/components/DownloadSection.module.css && git commit -m "style: add download content flex layout"

# Commit 121: Add download title styles
cat > src/components/DownloadSection.module.css << 'EOF'
.download {
  padding: 120px 24px;
  text-align: center;
}

.download-container {
  max-width: 800px;
  margin: 0 auto;
}

.download-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 24px;
}

.download-title {
  font-size: 2.5rem;
  font-weight: 700;
  color: var(--text-primary);
}
EOF
git add src/components/DownloadSection.module.css && git commit -m "style: add download title font styles"

# Commit 122: Add download subtitle styles
cat > src/components/DownloadSection.module.css << 'EOF'
.download {
  padding: 120px 24px;
  text-align: center;
}

.download-container {
  max-width: 800px;
  margin: 0 auto;
}

.download-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 24px;
}

.download-title {
  font-size: 2.5rem;
  font-weight: 700;
  color: var(--text-primary);
}

.download-subtitle {
  font-size: 1.1rem;
  color: var(--text-secondary);
  max-width: 500px;
}

.download-version {
  font-size: 0.8rem;
  color: var(--text-secondary);
}
EOF
git add src/components/DownloadSection.module.css && git commit -m "style: add download subtitle and version styles"

# Commit 123: Import styles in DownloadSection
cat > src/components/DownloadSection.tsx << 'EOF'
"use client";

import React from "react";
import styles from "./DownloadSection.module.css";

export default function DownloadSection() {
  return (
    <section className={styles.download}>
      <div className={styles.downloadContainer}>
        <div className={styles.downloadContent}>
          <h2 className={styles.downloadTitle}>Ready to get started?</h2>
          <p className={styles.downloadSubtitle}>Download Drop for macOS and start downloading videos instantly</p>
          <button className="btn-primary">
            Download for macOS
          </button>
          <span className={styles.downloadVersion}>Version 1.0.0 • macOS 15.0+</span>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/DownloadSection.tsx && git commit -m "refactor: import and use CSS module styles in DownloadSection"

# Commit 124: Create Footer.tsx
cat > src/components/Footer.tsx << 'EOF'
"use client";

import React from "react";
EOF
git add src/components/Footer.tsx && git commit -m "feat: create Footer component file"

# Commit 125: Add Footer function
cat > src/components/Footer.tsx << 'EOF'
"use client";

import React from "react";

export default function Footer() {
  return (
    <footer className="footer">
    </footer>
  );
}
EOF
git add src/components/Footer.tsx && git commit -m "feat: add Footer function component"

# Commit 126: Add footer container
cat > src/components/Footer.tsx << 'EOF'
"use client";

import React from "react";

export default function Footer() {
  return (
    <footer className="footer">
      <div className="footer-container">
      </div>
    </footer>
  );
}
EOF
git add src/components/Footer.tsx && git commit -m "style: add footer container div"

# Commit 127: Add footer content
cat > src/components/Footer.tsx << 'EOF'
"use client";

import React from "react";

export default function Footer() {
  return (
    <footer className="footer">
      <div className="footer-container">
        <div className="footer-content">
        </div>
      </div>
    </footer>
  );
}
EOF
git add src/components/Footer.tsx && git commit -m "style: add footer content wrapper"

# Commit 128: Add footer logo
cat > src/components/Footer.tsx << 'EOF'
"use client";

import React from "react";

export default function Footer() {
  return (
    <footer className="footer">
      <div className="footer-container">
        <div className="footer-content">
          <div className="footer-logo">
            <span className="logo-text">DROP</span>
          </div>
        </div>
      </div>
    </footer>
  );
}
EOF
git add src/components/Footer.tsx && git commit -m "feat: add footer logo section"

# Commit 129: Add footer description
cat > src/components/Footer.tsx << 'EOF'
"use client";

import React from "react";

export default function Footer() {
  return (
    <footer className="footer">
      <div className="footer-container">
        <div className="footer-content">
          <div className="footer-logo">
            <span className="logo-text">DROP</span>
            <p className="footer-description">A native macOS utility for instant video downloads.</p>
          </div>
        </div>
      </div>
    </footer>
  );
}
EOF
git add src/components/Footer.tsx && git commit -m "feat: add footer description text"

# Commit 130: Add footer links container
cat > src/components/Footer.tsx << 'EOF'
"use client";

import React from "react";

export default function Footer() {
  return (
    <footer className="footer">
      <div className="footer-container">
        <div className="footer-content">
          <div className="footer-logo">
            <span className="logo-text">DROP</span>
            <p className="footer-description">A native macOS utility for instant video downloads.</p>
          </div>
          <div className="footer-links">
          </div>
        </div>
      </div>
    </footer>
  );
}
EOF
git add src/components/Footer.tsx && git commit -m "feat: add footer links container"

# Commit 131: Add footer product links
cat > src/components/Footer.tsx << 'EOF'
"use client";

import React from "react";

export default function Footer() {
  return (
    <footer className="footer">
      <div className="footer-container">
        <div className="footer-content">
          <div className="footer-logo">
            <span className="logo-text">DROP</span>
            <p className="footer-description">A native macOS utility for instant video downloads.</p>
          </div>
          <div className="footer-links">
            <div className="footer-column">
              <h4 className="footer-heading">Product</h4>
              <a href="/features" className="footer-link">Features</a>
              <a href="/download" className="footer-link">Download</a>
              <a href="/about" className="footer-link">About</a>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
}
EOF
git add src/components/Footer.tsx && git commit -m "feat: add footer product links column"

# Commit 132: Add footer support links
cat > src/components/Footer.tsx << 'EOF'
"use client";

import React from "react";

export default function Footer() {
  return (
    <footer className="footer">
      <div className="footer-container">
        <div className="footer-content">
          <div className="footer-logo">
            <span className="logo-text">DROP</span>
            <p className="footer-description">A native macOS utility for instant video downloads.</p>
          </div>
          <div className="footer-links">
            <div className="footer-column">
              <h4 className="footer-heading">Product</h4>
              <a href="/features" className="footer-link">Features</a>
              <a href="/download" className="footer-link">Download</a>
              <a href="/about" className="footer-link">About</a>
            </div>
            <div className="footer-column">
              <h4 className="footer-heading">Support</h4>
              <a href="/contact" className="footer-link">Contact</a>
              <a href="#" className="footer-link">Documentation</a>
              <a href="#" className="footer-link">FAQ</a>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
}
EOF
git add src/components/Footer.tsx && git commit -m "feat: add footer support links column"

# Commit 133: Add footer copyright
cat > src/components/Footer.tsx << 'EOF'
"use client";

import React from "react";

export default function Footer() {
  return (
    <footer className="footer">
      <div className="footer-container">
        <div className="footer-content">
          <div className="footer-logo">
            <span className="logo-text">DROP</span>
            <p className="footer-description">A native macOS utility for instant video downloads.</p>
          </div>
          <div className="footer-links">
            <div className="footer-column">
              <h4 className="footer-heading">Product</h4>
              <a href="/features" className="footer-link">Features</a>
              <a href="/download" className="footer-link">Download</a>
              <a href="/about" className="footer-link">About</a>
            </div>
            <div className="footer-column">
              <h4 className="footer-heading">Support</h4>
              <a href="/contact" className="footer-link">Contact</a>
              <a href="#" className="footer-link">Documentation</a>
              <a href="#" className="footer-link">FAQ</a>
            </div>
          </div>
        </div>
        <div className="footer-bottom">
          <p className="footer-copyright">© 2024 Drop. All rights reserved.</p>
        </div>
      </div>
    </footer>
  );
}
EOF
git add src/components/Footer.tsx && git commit -m "feat: add footer copyright section"

# Commit 134: Create Footer.module.css
cat > src/components/Footer.module.css << 'EOF'
.footer {
  padding: 64px 24px 32px;
  background: var(--bg-secondary);
  border-top: 1px solid var(--border-color);
}
EOF
git add src/components/Footer.module.css && git commit -m "style: create Footer.module.css"

# Commit 135: Add footer container styles
cat > src/components/Footer.module.css << 'EOF'
.footer {
  padding: 64px 24px 32px;
  background: var(--bg-secondary);
  border-top: 1px solid var(--border-color);
}

.footer-container {
  max-width: 1200px;
  margin: 0 auto;
}
EOF
git add src/components/Footer.module.css && git commit -m "style: add footer container max-width"

# Commit 136: Add footer content styles
cat > src/components/Footer.module.css << 'EOF'
.footer {
  padding: 64px 24px 32px;
  background: var(--bg-secondary);
  border-top: 1px solid var(--border-color);
}

.footer-container {
  max-width: 1200px;
  margin: 0 auto;
}

.footer-content {
  display: flex;
  justify-content: space-between;
  gap: 64px;
  margin-bottom: 48px;
}

@media (max-width: 768px) {
  .footer-content {
    flex-direction: column;
    gap: 40px;
  }
}
EOF
git add src/components/Footer.module.css && git commit -m "style: add footer content flex layout"

# Commit 137: Add footer logo styles
cat > src/components/Footer.module.css << 'EOF'
.footer {
  padding: 64px 24px 32px;
  background: var(--bg-secondary);
  border-top: 1px solid var(--border-color);
}

.footer-container {
  max-width: 1200px;
  margin: 0 auto;
}

.footer-content {
  display: flex;
  justify-content: space-between;
  gap: 64px;
  margin-bottom: 48px;
}

.footer-logo .logo-text {
  font-size: 1.5rem;
  font-weight: 700;
  letter-spacing: 2px;
  color: var(--text-primary);
}

.footer-description {
  margin-top: 12px;
  font-size: 0.9rem;
  color: var(--text-secondary);
  max-width: 280px;
}

@media (max-width: 768px) {
  .footer-content {
    flex-direction: column;
    gap: 40px;
  }
}
EOF
git add src/components/Footer.module.css && git commit -m "style: add footer logo and description styles"

# Commit 138: Add footer links styles
cat > src/components/Footer.module.css << 'EOF'
.footer {
  padding: 64px 24px 32px;
  background: var(--bg-secondary);
  border-top: 1px solid var(--border-color);
}

.footer-container {
  max-width: 1200px;
  margin: 0 auto;
}

.footer-content {
  display: flex;
  justify-content: space-between;
  gap: 64px;
  margin-bottom: 48px;
}

.footer-logo .logo-text {
  font-size: 1.5rem;
  font-weight: 700;
  letter-spacing: 2px;
  color: var(--text-primary);
}

.footer-description {
  margin-top: 12px;
  font-size: 0.9rem;
  color: var(--text-secondary);
  max-width: 280px;
}

.footer-links {
  display: flex;
  gap: 64px;
}

.footer-column {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.footer-heading {
  font-size: 0.85rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  color: var(--text-primary);
  margin-bottom: 8px;
}

.footer-link {
  font-size: 0.9rem;
  color: var(--text-secondary);
  text-decoration: none;
  transition: color 0.2s;
}

.footer-link:hover {
  color: var(--text-primary);
}

@media (max-width: 768px) {
  .footer-content {
    flex-direction: column;
    gap: 40px;
  }
  
  .footer-links {
    gap: 40px;
  }
}
EOF
git add src/components/Footer.module.css && git commit -m "style: add footer links and column styles"

# Commit 139: Add footer bottom styles
cat > src/components/Footer.module.css << 'EOF'
.footer {
  padding: 64px 24px 32px;
  background: var(--bg-secondary);
  border-top: 1px solid var(--border-color);
}

.footer-container {
  max-width: 1200px;
  margin: 0 auto;
}

.footer-content {
  display: flex;
  justify-content: space-between;
  gap: 64px;
  margin-bottom: 48px;
}

.footer-logo .logo-text {
  font-size: 1.5rem;
  font-weight: 700;
  letter-spacing: 2px;
  color: var(--text-primary);
}

.footer-description {
  margin-top: 12px;
  font-size: 0.9rem;
  color: var(--text-secondary);
  max-width: 280px;
}

.footer-links {
  display: flex;
  gap: 64px;
}

.footer-column {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.footer-heading {
  font-size: 0.85rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  color: var(--text-primary);
  margin-bottom: 8px;
}

.footer-link {
  font-size: 0.9rem;
  color: var(--text-secondary);
  text-decoration: none;
  transition: color 0.2s;
}

.footer-link:hover {
  color: var(--text-primary);
}

.footer-bottom {
  padding-top: 32px;
  border-top: 1px solid var(--border-color);
  text-align: center;
}

.footer-copyright {
  font-size: 0.8rem;
  color: var(--text-secondary);
}

@media (max-width: 768px) {
  .footer-content {
    flex-direction: column;
    gap: 40px;
  }
  
  .footer-links {
    gap: 40px;
  }
}
EOF
git add src/components/Footer.module.css && git commit -m "style: add footer bottom and copyright styles"

# Commit 140: Import styles in Footer
cat > src/components/Footer.tsx << 'EOF'
"use client";

import React from "react";
import styles from "./Footer.module.css";

export default function Footer() {
  return (
    <footer className={styles.footer}>
      <div className={styles.footerContainer}>
        <div className={styles.footerContent}>
          <div className={styles.footerLogo}>
            <span className="logo-text">DROP</span>
            <p className={styles.footerDescription}>A native macOS utility for instant video downloads.</p>
          </div>
          <div className={styles.footerLinks}>
            <div className={styles.footerColumn}>
              <h4 className={styles.footerHeading}>Product</h4>
              <a href="/features" className={styles.footerLink}>Features</a>
              <a href="/download" className={styles.footerLink}>Download</a>
              <a href="/about" className={styles.footerLink}>About</a>
            </div>
            <div className={styles.footerColumn}>
              <h4 className={styles.footerHeading}>Support</h4>
              <a href="/contact" className={styles.footerLink}>Contact</a>
              <a href="#" className={styles.footerLink}>Documentation</a>
              <a href="#" className={styles.footerLink}>FAQ</a>
            </div>
          </div>
        </div>
        <div className={styles.footerBottom}>
          <p className={styles.footerCopyright}>© 2024 Drop. All rights reserved.</p>
        </div>
      </div>
    </footer>
  );
}
EOF
git add src/components/Footer.tsx && git commit -m "refactor: import and use CSS module styles in Footer"

echo "Phase 7 DownloadSection and Footer complete"
