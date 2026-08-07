#!/bin/bash
cd /Users/afraasheriff/Desktop/The_Atom/Atom-Originals/drop/website-demo

# ============================================
# PHASE 4: Navbar Component (commits 46-80)
# ============================================

# Commit 46: Create Navbar.tsx file
cat > src/components/Navbar.tsx << 'EOF'
"use client";
EOF
git add src/components/Navbar.tsx && git commit -m "feat: create Navbar component with use client directive"

# Commit 47: Add React import
cat > src/components/Navbar.tsx << 'EOF'
"use client";

import React from "react";
EOF
git add src/components/Navbar.tsx && git commit -m "feat: add React import to Navbar"

# Commit 48: Add useState import
cat > src/components/Navbar.tsx << 'EOF'
"use client";

import React, { useState } from "react";
EOF
git add src/components/Navbar.tsx && git commit -m "feat: add useState hook import to Navbar"

# Commit 49: Add Link import
cat > src/components/Navbar.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import Link from "next/link";
EOF
git add src/components/Navbar.tsx && git commit -m "feat: add Link import from next/link"

# Commit 50: Add Navbar function
cat > src/components/Navbar.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import Link from "next/link";

export default function Navbar() {
  return (
    <nav></nav>
  );
}
EOF
git add src/components/Navbar.tsx && git commit -m "feat: add Navbar function component"

# Commit 51: Add nav container div
cat > src/components/Navbar.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import Link from "next/link";

export default function Navbar() {
  return (
    <nav className="navbar">
      <div className="navbar-container"></div>
    </nav>
  );
}
EOF
git add src/components/Navbar.tsx && git commit -m "style: add navbar container div"

# Commit 52: Add logo section
cat > src/components/Navbar.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import Link from "next/link";

export default function Navbar() {
  return (
    <nav className="navbar">
      <div className="navbar-container">
        <div className="navbar-logo">
          <Link href="/">
            <span className="logo-text">DROP</span>
          </Link>
        </div>
      </div>
    </nav>
  );
}
EOF
git add src/components/Navbar.tsx && git commit -m "feat: add logo section with Link component"

# Commit 53: Add nav links container
cat > src/components/Navbar.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import Link from "next/link";

export default function Navbar() {
  return (
    <nav className="navbar">
      <div className="navbar-container">
        <div className="navbar-logo">
          <Link href="/">
            <span className="logo-text">DROP</span>
          </Link>
        </div>
        <div className="navbar-links"></div>
      </div>
    </nav>
  );
}
EOF
git add src/components/Navbar.tsx && git commit -m "feat: add navbar links container"

# Commit 54: Add Home link
cat > src/components/Navbar.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import Link from "next/link";

export default function Navbar() {
  return (
    <nav className="navbar">
      <div className="navbar-container">
        <div className="navbar-logo">
          <Link href="/">
            <span className="logo-text">DROP</span>
          </Link>
        </div>
        <div className="navbar-links">
          <Link href="/" className="nav-link">Home</Link>
        </div>
      </div>
    </nav>
  );
}
EOF
git add src/components/Navbar.tsx && git commit -m "feat: add Home navigation link"

# Commit 55: Add About link
cat > src/components/Navbar.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import Link from "next/link";

export default function Navbar() {
  return (
    <nav className="navbar">
      <div className="navbar-container">
        <div className="navbar-logo">
          <Link href="/">
            <span className="logo-text">DROP</span>
          </Link>
        </div>
        <div className="navbar-links">
          <Link href="/" className="nav-link">Home</Link>
          <Link href="/about" className="nav-link">About</Link>
        </div>
      </div>
    </nav>
  );
}
EOF
git add src/components/Navbar.tsx && git commit -m "feat: add About navigation link"

# Commit 56: Add Features link
cat > src/components/Navbar.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import Link from "next/link";

export default function Navbar() {
  return (
    <nav className="navbar">
      <div className="navbar-container">
        <div className="navbar-logo">
          <Link href="/">
            <span className="logo-text">DROP</span>
          </Link>
        </div>
        <div className="navbar-links">
          <Link href="/" className="nav-link">Home</Link>
          <Link href="/about" className="nav-link">About</Link>
          <Link href="/features" className="nav-link">Features</Link>
        </div>
      </div>
    </nav>
  );
}
EOF
git add src/components/Navbar.tsx && git commit -m "feat: add Features navigation link"

# Commit 57: Add Download link
cat > src/components/Navbar.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import Link from "next/link";

export default function Navbar() {
  return (
    <nav className="navbar">
      <div className="navbar-container">
        <div className="navbar-logo">
          <Link href="/">
            <span className="logo-text">DROP</span>
          </Link>
        </div>
        <div className="navbar-links">
          <Link href="/" className="nav-link">Home</Link>
          <Link href="/about" className="nav-link">About</Link>
          <Link href="/features" className="nav-link">Features</Link>
          <Link href="/download" className="nav-link">Download</Link>
        </div>
      </div>
    </nav>
  );
}
EOF
git add src/components/Navbar.tsx && git commit -m "feat: add Download navigation link"

# Commit 58: Add Contact link
cat > src/components/Navbar.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import Link from "next/link";

export default function Navbar() {
  return (
    <nav className="navbar">
      <div className="navbar-container">
        <div className="navbar-logo">
          <Link href="/">
            <span className="logo-text">DROP</span>
          </Link>
        </div>
        <div className="navbar-links">
          <Link href="/" className="nav-link">Home</Link>
          <Link href="/about" className="nav-link">About</Link>
          <Link href="/features" className="nav-link">Features</Link>
          <Link href="/download" className="nav-link">Download</Link>
          <Link href="/contact" className="nav-link">Contact</Link>
        </div>
      </div>
    </nav>
  );
}
EOF
git add src/components/Navbar.tsx && git commit -m "feat: add Contact navigation link"

# Commit 59: Add mobile menu button
cat > src/components/Navbar.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import Link from "next/link";

export default function Navbar() {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  return (
    <nav className="navbar">
      <div className="navbar-container">
        <div className="navbar-logo">
          <Link href="/">
            <span className="logo-text">DROP</span>
          </Link>
        </div>
        <button 
          className="mobile-menu-btn"
          onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
        >
          ☰
        </button>
        <div className="navbar-links">
          <Link href="/" className="nav-link">Home</Link>
          <Link href="/about" className="nav-link">About</Link>
          <Link href="/features" className="nav-link">Features</Link>
          <Link href="/download" className="nav-link">Download</Link>
          <Link href="/contact" className="nav-link">Contact</Link>
        </div>
      </div>
    </nav>
  );
}
EOF
git add src/components/Navbar.tsx && git commit -m "feat: add mobile menu toggle button"

# Commit 60: Create Navbar.module.css
cat > src/components/Navbar.module.css << 'EOF'
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
  background: rgba(255, 255, 255, 0.8);
  backdrop-filter: blur(12px);
  border-bottom: 1px solid var(--border-color);
}
EOF
git add src/components/Navbar.module.css && git commit -m "style: create Navbar.module.css with fixed positioning"

# Commit 61: Add navbar container styles
cat > src/components/Navbar.module.css << 'EOF'
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
  background: rgba(255, 255, 255, 0.8);
  backdrop-filter: blur(12px);
  border-bottom: 1px solid var(--border-color);
}

.navbar-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
  height: 64px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
EOF
git add src/components/Navbar.module.css && git commit -m "style: add navbar container max-width and flex layout"

# Commit 62: Add logo styles
cat > src/components/Navbar.module.css << 'EOF'
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
  background: rgba(255, 255, 255, 0.8);
  backdrop-filter: blur(12px);
  border-bottom: 1px solid var(--border-color);
}

.navbar-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
  height: 64px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.navbar-logo a {
  text-decoration: none;
  color: var(--text-primary);
}

.logo-text {
  font-size: 1.5rem;
  font-weight: 700;
  letter-spacing: 2px;
}
EOF
git add src/components/Navbar.module.css && git commit -m "style: add logo text styles with letter spacing"

# Commit 63: Add nav-link styles
cat > src/components/Navbar.module.css << 'EOF'
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
  background: rgba(255, 255, 255, 0.8);
  backdrop-filter: blur(12px);
  border-bottom: 1px solid var(--border-color);
}

.navbar-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
  height: 64px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.navbar-logo a {
  text-decoration: none;
  color: var(--text-primary);
}

.logo-text {
  font-size: 1.5rem;
  font-weight: 700;
  letter-spacing: 2px;
}

.navbar-links {
  display: flex;
  gap: 32px;
}

.nav-link {
  text-decoration: none;
  color: var(--text-secondary);
  font-size: 0.9rem;
  font-weight: 500;
  transition: color 0.2s;
}

.nav-link:hover {
  color: var(--text-primary);
}
EOF
git add src/components/Navbar.module.css && git commit -m "style: add navigation link styles with hover"

# Commit 64: Add mobile menu button styles
cat > src/components/Navbar.module.css << 'EOF'
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
  background: rgba(255, 255, 255, 0.8);
  backdrop-filter: blur(12px);
  border-bottom: 1px solid var(--border-color);
}

.navbar-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
  height: 64px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.navbar-logo a {
  text-decoration: none;
  color: var(--text-primary);
}

.logo-text {
  font-size: 1.5rem;
  font-weight: 700;
  letter-spacing: 2px;
}

.navbar-links {
  display: flex;
  gap: 32px;
}

.nav-link {
  text-decoration: none;
  color: var(--text-secondary);
  font-size: 0.9rem;
  font-weight: 500;
  transition: color 0.2s;
}

.nav-link:hover {
  color: var(--text-primary);
}

.mobile-menu-btn {
  display: none;
  background: none;
  border: none;
  font-size: 1.5rem;
  cursor: pointer;
  color: var(--text-primary);
}

@media (max-width: 768px) {
  .mobile-menu-btn {
    display: block;
  }
  
  .navbar-links {
    display: none;
  }
}
EOF
git add src/components/Navbar.module.css && git commit -m "style: add mobile menu button with responsive breakpoint"

# Commit 65: Import styles in Navbar
cat > src/components/Navbar.tsx << 'EOF'
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
          <Link href="/contact" className={styles.navLink}>Contact</Link>
        </div>
      </div>
    </nav>
  );
}
EOF
git add src/components/Navbar.tsx && git commit -m "refactor: import and use CSS module styles in Navbar"

echo "Phase 4 Navbar complete"
