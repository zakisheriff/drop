#!/bin/bash
cd /Users/afraasheriff/Desktop/The_Atom/Atom-Originals/drop/website-demo

# ============================================
# PHASE 5: Hero Component (commits 66-100)
# ============================================

# Commit 66: Create Hero.tsx
cat > src/components/Hero.tsx << 'EOF'
"use client";

import React from "react";
EOF
git add src/components/Hero.tsx && git commit -m "feat: create Hero component file"

# Commit 67: Add Hero function
cat > src/components/Hero.tsx << 'EOF'
"use client";

import React from "react";

export default function Hero() {
  return (
    <section className="hero">
    </section>
  );
}
EOF
git add src/components/Hero.tsx && git commit -m "feat: add Hero function component"

# Commit 68: Add hero container
cat > src/components/Hero.tsx << 'EOF'
"use client";

import React from "react";

export default function Hero() {
  return (
    <section className="hero">
      <div className="hero-container">
      </div>
    </section>
  );
}
EOF
git add src/components/Hero.tsx && git commit -m "style: add hero container div"

# Commit 69: Add hero content wrapper
cat > src/components/Hero.tsx << 'EOF'
"use client";

import React from "react";

export default function Hero() {
  return (
    <section className="hero">
      <div className="hero-container">
        <div className="hero-content">
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/Hero.tsx && git commit -m "style: add hero content wrapper div"

# Commit 70: Add hero badge
cat > src/components/Hero.tsx << 'EOF'
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
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/Hero.tsx && git commit -m "feat: add hero badge element"

# Commit 71: Add hero title
cat > src/components/Hero.tsx << 'EOF'
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
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/Hero.tsx && git commit -m "feat: add hero title heading"

# Commit 72: Add hero subtitle
cat > src/components/Hero.tsx << 'EOF'
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
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/Hero.tsx && git commit -m "feat: add hero subtitle paragraph"

# Commit 73: Add hero CTA buttons container
cat > src/components/Hero.tsx << 'EOF'
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
          </div>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/Hero.tsx && git commit -m "style: add hero CTA buttons container"

# Commit 74: Add primary CTA button
cat > src/components/Hero.tsx << 'EOF'
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
          </div>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/Hero.tsx && git commit -m "feat: add primary CTA download button"

# Commit 75: Add secondary CTA button
cat > src/components/Hero.tsx << 'EOF'
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
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/Hero.tsx && git commit -m "feat: add secondary CTA learn more button"

# Commit 76: Add hero info section
cat > src/components/Hero.tsx << 'EOF'
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
EOF
git add src/components/Hero.tsx && git commit -m "feat: add hero keyboard shortcut info"

# Commit 77: Add hero requirements text
cat > src/components/Hero.tsx << 'EOF'
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
          <span className="hero-requirements">Requires macOS 15.0+</span>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/Hero.tsx && git commit -m "feat: add hero system requirements text"

# Commit 78: Create Hero.module.css
cat > src/components/Hero.module.css << 'EOF'
.hero {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 120px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
}
EOF
git add src/components/Hero.module.css && git commit -m "style: create Hero.module.css with gradient background"

# Commit 79: Add hero container styles
cat > src/components/Hero.module.css << 'EOF'
.hero {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 120px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
}

.hero-container {
  max-width: 1200px;
  margin: 0 auto;
  width: 100%;
}
EOF
git add src/components/Hero.module.css && git commit -m "style: add hero container max-width"

# Commit 80: Add hero content styles
cat > src/components/Hero.module.css << 'EOF'
.hero {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 120px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
}

.hero-container {
  max-width: 1200px;
  margin: 0 auto;
  width: 100%;
}

.hero-content {
  text-align: center;
  max-width: 800px;
  margin: 0 auto;
}
EOF
git add src/components/Hero.module.css && git commit -m "style: add hero content center alignment"

# Commit 81: Add hero badge styles
cat > src/components/Hero.module.css << 'EOF'
.hero {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 120px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
}

.hero-container {
  max-width: 1200px;
  margin: 0 auto;
  width: 100%;
}

.hero-content {
  text-align: center;
  max-width: 800px;
  margin: 0 auto;
}

.hero-badge {
  display: inline-flex;
  align-items: center;
  padding: 6px 16px;
  background: rgba(0, 102, 255, 0.1);
  border-radius: 100px;
  margin-bottom: 24px;
}

.hero-badge span {
  font-size: 0.85rem;
  font-weight: 600;
  color: var(--accent-blue);
}
EOF
git add src/components/Hero.module.css && git commit -m "style: add hero badge with blue accent"

# Commit 82: Add hero title styles
cat > src/components/Hero.module.css << 'EOF'
.hero {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 120px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
}

.hero-container {
  max-width: 1200px;
  margin: 0 auto;
  width: 100%;
}

.hero-content {
  text-align: center;
  max-width: 800px;
  margin: 0 auto;
}

.hero-badge {
  display: inline-flex;
  align-items: center;
  padding: 6px 16px;
  background: rgba(0, 102, 255, 0.1);
  border-radius: 100px;
  margin-bottom: 24px;
}

.hero-badge span {
  font-size: 0.85rem;
  font-weight: 600;
  color: var(--accent-blue);
}

.hero-title {
  font-size: 4rem;
  font-weight: 700;
  line-height: 1.1;
  margin-bottom: 24px;
  color: var(--text-primary);
}

@media (max-width: 768px) {
  .hero-title {
    font-size: 2.5rem;
  }
}
EOF
git add src/components/Hero.module.css && git commit -m "style: add hero title with responsive font size"

# Commit 83: Add hero subtitle styles
cat > src/components/Hero.module.css << 'EOF'
.hero {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 120px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
}

.hero-container {
  max-width: 1200px;
  margin: 0 auto;
  width: 100%;
}

.hero-content {
  text-align: center;
  max-width: 800px;
  margin: 0 auto;
}

.hero-badge {
  display: inline-flex;
  align-items: center;
  padding: 6px 16px;
  background: rgba(0, 102, 255, 0.1);
  border-radius: 100px;
  margin-bottom: 24px;
}

.hero-badge span {
  font-size: 0.85rem;
  font-weight: 600;
  color: var(--accent-blue);
}

.hero-title {
  font-size: 4rem;
  font-weight: 700;
  line-height: 1.1;
  margin-bottom: 24px;
  color: var(--text-primary);
}

.hero-subtitle {
  font-size: 1.25rem;
  line-height: 1.6;
  color: var(--text-secondary);
  margin-bottom: 40px;
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
}

@media (max-width: 768px) {
  .hero-title {
    font-size: 2.5rem;
  }
  
  .hero-subtitle {
    font-size: 1rem;
  }
}
EOF
git add src/components/Hero.module.css && git commit -m "style: add hero subtitle with max-width"

# Commit 84: Add hero CTA styles
cat > src/components/Hero.module.css << 'EOF'
.hero {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 120px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
}

.hero-container {
  max-width: 1200px;
  margin: 0 auto;
  width: 100%;
}

.hero-content {
  text-align: center;
  max-width: 800px;
  margin: 0 auto;
}

.hero-badge {
  display: inline-flex;
  align-items: center;
  padding: 6px 16px;
  background: rgba(0, 102, 255, 0.1);
  border-radius: 100px;
  margin-bottom: 24px;
}

.hero-badge span {
  font-size: 0.85rem;
  font-weight: 600;
  color: var(--accent-blue);
}

.hero-title {
  font-size: 4rem;
  font-weight: 700;
  line-height: 1.1;
  margin-bottom: 24px;
  color: var(--text-primary);
}

.hero-subtitle {
  font-size: 1.25rem;
  line-height: 1.6;
  color: var(--text-secondary);
  margin-bottom: 40px;
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
}

.hero-cta {
  display: flex;
  gap: 16px;
  justify-content: center;
  margin-bottom: 32px;
}

@media (max-width: 768px) {
  .hero-title {
    font-size: 2.5rem;
  }
  
  .hero-subtitle {
    font-size: 1rem;
  }
  
  .hero-cta {
    flex-direction: column;
    align-items: center;
  }
}
EOF
git add src/components/Hero.module.css && git commit -m "style: add hero CTA flex layout with gap"

# Commit 85: Add hero info styles
cat > src/components/Hero.module.css << 'EOF'
.hero {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 120px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
}

.hero-container {
  max-width: 1200px;
  margin: 0 auto;
  width: 100%;
}

.hero-content {
  text-align: center;
  max-width: 800px;
  margin: 0 auto;
}

.hero-badge {
  display: inline-flex;
  align-items: center;
  padding: 6px 16px;
  background: rgba(0, 102, 255, 0.1);
  border-radius: 100px;
  margin-bottom: 24px;
}

.hero-badge span {
  font-size: 0.85rem;
  font-weight: 600;
  color: var(--accent-blue);
}

.hero-title {
  font-size: 4rem;
  font-weight: 700;
  line-height: 1.1;
  margin-bottom: 24px;
  color: var(--text-primary);
}

.hero-subtitle {
  font-size: 1.25rem;
  line-height: 1.6;
  color: var(--text-secondary);
  margin-bottom: 40px;
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
}

.hero-cta {
  display: flex;
  gap: 16px;
  justify-content: center;
  margin-bottom: 32px;
}

.hero-info {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  margin-bottom: 16px;
}

.hero-info-text {
  font-size: 0.9rem;
  color: var(--text-secondary);
}

.hero-keycap {
  background-color: var(--bg-tertiary);
  border: 1px solid #d5d5d5;
  border-radius: 4px;
  padding: 2px 8px;
  font-family: monospace;
  font-size: 0.85rem;
  font-weight: 600;
  color: var(--text-primary);
  box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
}

.hero-requirements {
  font-size: 0.75rem;
  color: var(--text-secondary);
}

@media (max-width: 768px) {
  .hero-title {
    font-size: 2.5rem;
  }
  
  .hero-subtitle {
    font-size: 1rem;
  }
  
  .hero-cta {
    flex-direction: column;
    align-items: center;
  }
}
EOF
git add src/components/Hero.module.css && git commit -m "style: add hero info and keycap styles"

# Commit 86: Import styles in Hero
cat > src/components/Hero.tsx << 'EOF'
"use client";

import React from "react";
import styles from "./Hero.module.css";

export default function Hero() {
  return (
    <section className={styles.hero}>
      <div className={styles.heroContainer}>
        <div className={styles.heroContent}>
          <div className={styles.heroBadge}>
            <span>New Release</span>
          </div>
          <h1 className={styles.heroTitle}>
            Copy. Download. Done.
          </h1>
          <p className={styles.heroSubtitle}>
            A native macOS utility that monitors your clipboard for video links and downloads them instantly.
          </p>
          <div className={styles.heroCta}>
            <button className="btn-primary">
              Download for macOS
            </button>
            <button className="btn-secondary">
              Learn More
            </button>
          </div>
          <div className={styles.heroInfo}>
            <span className={styles.heroInfoText}>Press</span>
            <span className={styles.heroKeycap}>⌃D</span>
            <span className={styles.heroInfoText}>to download instantly</span>
          </div>
          <span className={styles.heroRequirements}>Requires macOS 15.0+</span>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/Hero.tsx && git commit -m "refactor: import and use CSS module styles in Hero"

echo "Phase 5 Hero complete"
