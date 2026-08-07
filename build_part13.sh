#!/bin/bash
cd /Users/afraasheriff/Desktop/The_Atom/Atom-Originals/drop/website-demo

# ============================================
# PHASE 13: More micro-commits (commits 281-350)
# ============================================

# Commit 281: Add dark mode variables
cat >> src/app/globals.css << 'EOF'

@media (prefers-color-scheme: dark) {
  :root {
    --bg-primary: #0a0a0a;
    --bg-secondary: #111111;
    --bg-tertiary: #1a1a1a;
    --border-color: #262626;
    --border-hover: #404040;
    --text-primary: #f5f5f5;
    --text-secondary: #a0a0a0;
  }
}
EOF
git add src/app/globals.css && git commit -m "style: add dark mode CSS variables"

# Commit 282: Add prefers-reduced-motion
cat >> src/app/globals.css << 'EOF'

@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
EOF
git add src/app/globals.css && git commit -m "style: add prefers-reduced-motion support"

# Commit 283: Add print styles
cat >> src/app/globals.css << 'EOF'

@media print {
  .navbar, .footer {
    display: none;
  }
  
  body {
    overflow: visible;
  }
}
EOF
git add src/app/globals.css && git commit -m "style: add print media styles"

# Commit 284: Add container utility
cat >> src/app/globals.css << 'EOF'

.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
}
EOF
git add src/app/globals.css && git commit -m "style: add container utility class"

# Commit 285: Add sr-only utility
cat >> src/app/globals.css << 'EOF'

.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border-width: 0;
}
EOF
git add src/app/globals.css && git commit -m "style: add screen reader only utility class"

# Commit 286: Update Hero - add gradient text
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
  animation: fadeIn 0.6s ease-out;
}

.hero-badge {
  display: inline-flex;
  align-items: center;
  padding: 6px 16px;
  background: rgba(0, 102, 255, 0.1);
  border-radius: 100px;
  margin-bottom: 24px;
  animation: slideDown 0.6s ease-out;
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
  animation: slideUp 0.6s ease-out 0.1s both;
}

.hero-title-gradient {
  background: linear-gradient(135deg, #0066ff 0%, #7c3aed 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.hero-subtitle {
  font-size: 1.25rem;
  line-height: 1.6;
  color: var(--text-secondary);
  margin-bottom: 40px;
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
  animation: slideUp 0.6s ease-out 0.2s both;
}

.hero-cta {
  display: flex;
  gap: 16px;
  justify-content: center;
  margin-bottom: 32px;
  animation: slideUp 0.6s ease-out 0.3s both;
}

.hero-info {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  margin-bottom: 16px;
  animation: slideUp 0.6s ease-out 0.4s both;
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
  animation: slideUp 0.6s ease-out 0.5s both;
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
git add src/components/Hero.module.css && git commit -m "style: add gradient text class to Hero title"

# Commit 287: Update Hero.tsx with gradient
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
            <span className={styles.heroTitleGradient}>Copy. Download. Done.</span>
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
git add src/components/Hero.tsx && git commit -m "feat: add gradient text to Hero title"

# Commit 288: Add btn-primary disabled state
cat >> src/app/globals.css << 'EOF'

.btn-primary:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.btn-secondary:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
EOF
git add src/app/globals.css && git commit -m "style: add disabled state to buttons"

# Commit 289: Add btn-icon utility
cat >> src/app/globals.css << 'EOF'

.btn-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  padding: 0;
  border-radius: 50%;
  background: transparent;
  border: 1px solid var(--border-color);
  cursor: pointer;
  transition: background-color 0.2s, border-color 0.2s;
}

.btn-icon:hover {
  background: var(--bg-secondary);
  border-color: var(--border-hover);
}
EOF
git add src/app/globals.css && git commit -m "style: add btn-icon utility class"

# Commit 290: Add input error state
cat >> src/app/globals.css << 'EOF'

.input-error {
  border-color: #dc2626 !important;
}

.input-error:focus {
  box-shadow: 0 0 0 3px rgba(220, 38, 38, 0.1) !important;
}
EOF
git add src/app/globals.css && git commit -m "style: add input error state styles"

# Commit 291: Add badge utility
cat >> src/app/globals.css << 'EOF'

.badge {
  display: inline-flex;
  align-items: center;
  padding: 4px 12px;
  font-size: 0.75rem;
  font-weight: 600;
  border-radius: 100px;
  background: var(--bg-secondary);
  color: var(--text-secondary);
}

.badge-blue {
  background: rgba(0, 102, 255, 0.1);
  color: var(--accent-blue);
}

.badge-green {
  background: rgba(0, 200, 83, 0.1);
  color: var(--accent-green);
}

.badge-purple {
  background: rgba(124, 58, 237, 0.1);
  color: var(--accent-purple);
}
EOF
git add src/app/globals.css && git commit -m "style: add badge utility classes"

# Commit 292: Add divider utility
cat >> src/app/globals.css << 'EOF'

.divider {
  width: 100%;
  height: 1px;
  background: var(--border-color);
}

.divider-vertical {
  width: 1px;
  height: 100%;
  background: var(--border-color);
}
EOF
git add src/app/globals.css && git commit -m "style: add divider utility classes"

# Commit 293: Add card utility
cat >> src/app/globals.css << 'EOF'

.card {
  padding: 24px;
  background: var(--bg-primary);
  border-radius: 16px;
  border: 1px solid var(--border-color);
}

.card-hover {
  transition: border-color 0.2s, box-shadow 0.2s;
}

.card-hover:hover {
  border-color: var(--border-hover);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}
EOF
git add src/app/globals.css && git commit -m "style: add card utility classes"

# Commit 294: Add text utility classes
cat >> src/app/globals.css << 'EOF'

.text-xs { font-size: 0.75rem; }
.text-sm { font-size: 0.875rem; }
.text-base { font-size: 1rem; }
.text-lg { font-size: 1.125rem; }
.text-xl { font-size: 1.25rem; }
.text-2xl { font-size: 1.5rem; }
.text-3xl { font-size: 1.875rem; }
.text-4xl { font-size: 2.25rem; }

.font-normal { font-weight: 400; }
.font-medium { font-weight: 500; }
.font-semibold { font-weight: 600; }
.font-bold { font-weight: 700; }
EOF
git add src/app/globals.css && git commit -m "style: add text size and weight utility classes"

# Commit 295: Add flex utility classes
cat >> src/app/globals.css << 'EOF'

.flex { display: flex; }
.flex-col { flex-direction: column; }
.flex-row { flex-direction: row; }
.flex-wrap { flex-wrap: wrap; }
.items-center { align-items: center; }
.items-start { align-items: flex-start; }
.items-end { align-items: flex-end; }
.justify-center { justify-content: center; }
.justify-between { justify-content: space-between; }
.justify-start { justify-content: flex-start; }
.justify-end { justify-content: flex-end; }
.gap-1 { gap: 4px; }
.gap-2 { gap: 8px; }
.gap-3 { gap: 12px; }
.gap-4 { gap: 16px; }
.gap-6 { gap: 24px; }
.gap-8 { gap: 32px; }
EOF
git add src/app/globals.css && git commit -m "style: add flex utility classes"

# Commit 296: Add spacing utility classes
cat >> src/app/globals.css << 'EOF'

.p-0 { padding: 0; }
.p-1 { padding: 4px; }
.p-2 { padding: 8px; }
.p-3 { padding: 12px; }
.p-4 { padding: 16px; }
.p-6 { padding: 24px; }
.p-8 { padding: 32px; }

.px-4 { padding-left: 16px; padding-right: 16px; }
.px-6 { padding-left: 24px; padding-right: 24px; }
.px-8 { padding-left: 32px; padding-right: 32px; }

.py-4 { padding-top: 16px; padding-bottom: 16px; }
.py-6 { padding-top: 24px; padding-bottom: 24px; }
.py-8 { padding-top: 32px; padding-bottom: 32px; }

.m-0 { margin: 0; }
.m-1 { margin: 4px; }
.m-2 { margin: 8px; }
.m-3 { margin: 12px; }
.m-4 { margin: 16px; }

.mx-auto { margin-left: auto; margin-right: auto; }

.mt-4 { margin-top: 16px; }
.mt-6 { margin-top: 24px; }
.mt-8 { margin-top: 32px; }

.mb-4 { margin-bottom: 16px; }
.mb-6 { margin-bottom: 24px; }
.mb-8 { margin-bottom: 32px; }
EOF
git add src/app/globals.css && git commit -m "style: add spacing utility classes"

# Commit 297: Add width utility classes
cat >> src/app/globals.css << 'EOF'

.w-full { width: 100%; }
.w-auto { width: auto; }
.max-w-sm { max-width: 24rem; }
.max-w-md { max-width: 28rem; }
.max-w-lg { max-width: 32rem; }
.max-w-xl { max-width: 36rem; }
.max-w-2xl { max-width: 42rem; }
.max-w-3xl { max-width: 48rem; }
.max-w-4xl { max-width: 56rem; }
.max-w-5xl { max-width: 64rem; }
.max-w-6xl { max-width: 72rem; }
EOF
git add src/app/globals.css && git commit -m "style: add width utility classes"

# Commit 298: Add overflow utility classes
cat >> src/app/globals.css << 'EOF'

.overflow-hidden { overflow: hidden; }
.overflow-auto { overflow: auto; }
.overflow-scroll { overflow: scroll; }
.overflow-visible { overflow: visible; }
EOF
git add src/app/globals.css && git commit -m "style: add overflow utility classes"

# Commit 299: Add position utility classes
cat >> src/app/globals.css << 'EOF'

.relative { position: relative; }
.absolute { position: absolute; }
.fixed { position: fixed; }
.sticky { position: sticky; }
EOF
git add src/app/globals.css && git commit -m "style: add position utility classes"

# Commit 300: Add visibility utility classes
cat >> src/app/globals.css << 'EOF'

.visible { visibility: visible; }
.invisible { visibility: hidden; }
.opacity-0 { opacity: 0; }
.opacity-50 { opacity: 0.5; }
.opacity-100 { opacity: 1; }
EOF
git add src/app/globals.css && git commit -m "style: add visibility utility classes"

# Commit 301: Add cursor utility classes
cat >> src/app/globals.css << 'EOF'

.cursor-pointer { cursor: pointer; }
.cursor-default { cursor: default; }
.cursor-not-allowed { cursor: not-allowed; }
.cursor-grab { cursor: grab; }
.cursor-grabbing { cursor: grabbing; }
EOF
git add src/app/globals.css && git commit -m "style: add cursor utility classes"

# Commit 302: Add border utility classes
cat >> src/app/globals.css << 'EOF'

.border { border: 1px solid var(--border-color); }
.border-0 { border: 0; }
.border-2 { border: 2px solid var(--border-color); }

.rounded { border-radius: 4px; }
.rounded-md { border-radius: 8px; }
.rounded-lg { border-radius: 12px; }
.rounded-xl { border-radius: 16px; }
.rounded-2xl { border-radius: 24px; }
.rounded-full { border-radius: 9999px; }
EOF
git add src/app/globals.css && git commit -m "style: add border utility classes"

# Commit 303: Add shadow utility classes
cat >> src/app/globals.css << 'EOF'

.shadow-sm { box-shadow: var(--shadow-sm); }
.shadow { box-shadow: var(--shadow-md); }
.shadow-lg { box-shadow: var(--shadow-lg); }
.shadow-xl { box-shadow: var(--shadow-xl); }
.shadow-none { box-shadow: none; }
EOF
git add src/app/globals.css && git commit -m "style: add shadow utility classes"

# Commit 304: Add transition utility classes
cat >> src/app/globals.css << 'EOF'

.transition { transition: all var(--transition-normal); }
.transition-fast { transition: all var(--transition-fast); }
.transition-slow { transition: all var(--transition-slow); }
.transition-none { transition: none; }
EOF
git add src/app/globals.css && git commit -m "style: add transition utility classes"

# Commit 305: Add transform utility classes
cat >> src/app/globals.css << 'EOF'

.scale-95 { transform: scale(0.95); }
.scale-100 { transform: scale(1); }
.scale-105 { transform: scale(1.05); }
.rotate-45 { transform: rotate(45deg); }
.rotate-90 { transform: rotate(90deg); }
.rotate-180 { transform: rotate(180deg); }
.translate-y-0 { transform: translateY(0); }
.translate-y-1 { transform: translateY(4px); }
.translate-y-2 { transform: translateY(8px); }
.translate-y-4 { transform: translateY(16px); }
EOF
git add src/app/globals.css && git commit -m "style: add transform utility classes"

# Commit 306: Add text align utility classes
cat >> src/app/globals.css << 'EOF'

.text-left { text-align: left; }
.text-center { text-align: center; }
.text-right { text-align: right; }
.text-justify { text-align: justify; }
EOF
git add src/app/globals.css && git commit -m "style: add text align utility classes"

# Commit 307: Add text color utility classes
cat >> src/app/globals.css << 'EOF'

.text-primary { color: var(--text-primary); }
.text-secondary { color: var(--text-secondary); }
.text-blue { color: var(--accent-blue); }
.text-green { color: var(--accent-green); }
.text-purple { color: var(--accent-purple); }
.text-white { color: #ffffff; }
.text-black { color: #000000; }
EOF
git add src/app/globals.css && git commit -m "style: add text color utility classes"

# Commit 308: Add background utility classes
cat >> src/app/globals.css << 'EOF'

.bg-primary { background-color: var(--bg-primary); }
.bg-secondary { background-color: var(--bg-secondary); }
.bg-tertiary { background-color: var(--bg-tertiary); }
.bg-transparent { background-color: transparent; }
.bg-white { background-color: #ffffff; }
.bg-black { background-color: #000000; }
EOF
git add src/app/globals.css && git commit -m "style: add background utility classes"

# Commit 309: Add line height utility classes
cat >> src/app/globals.css << 'EOF'

.leading-none { line-height: 1; }
.leading-tight { line-height: 1.25; }
.leading-normal { line-height: 1.5; }
.leading-relaxed { line-height: 1.75; }
.leading-loose { line-height: 2; }
EOF
git add src/app/globals.css && git commit -m "style: add line height utility classes"

# Commit 310: Add letter spacing utility classes
cat >> src/app/globals.css << 'EOF'

.tracking-tight { letter-spacing: -0.05em; }
.tracking-normal { letter-spacing: 0; }
.tracking-wide { letter-spacing: 0.05em; }
.tracking-wider { letter-spacing: 0.1em; }
.tracking-widest { letter-spacing: 0.2em; }
EOF
git add src/app/globals.css && git commit -m "style: add letter spacing utility classes"

# Commit 311: Add whitespace utility classes
cat >> src/app/globals.css << 'EOF'

.whitespace-normal { white-space: normal; }
.whitespace-nowrap { white-space: nowrap; }
.whitespace-pre { white-space: pre; }
.whitespace-pre-line { white-space: pre-line; }
.whitespace-pre-wrap { white-space: pre-wrap; }
EOF
git add src/app/globals.css && git commit -m "style: add whitespace utility classes"

# Commit 312: Add word break utility classes
cat >> src/app/globals.css << 'EOF'

.break-normal { overflow-wrap: normal; word-break: normal; }
.break-words { overflow-wrap: break-word; }
.break-all { word-break: break-all; }
.break-keep { word-break: keep-all; }
EOF
git add src/app/globals.css && git commit -m "style: add word break utility classes"

# Commit 313: Add list style utility classes
cat >> src/app/globals.css << 'EOF'

.list-none { list-style: none; }
.list-disc { list-style: disc; }
.list-decimal { list-style: decimal; }
.list-inside { list-style-position: inside; }
.list-outside { list-style-position: outside; }
EOF
git add src/app/globals.css && git commit -m "style: add list style utility classes"

# Commit 314: Add appearance utility classes
cat >> src/app/globals.css << 'EOF'

.appearance-none { appearance: none; }
.outline-none { outline: none; }
EOF
git add src/app/globals.css && git commit -m "style: add appearance utility classes"

# Commit 315: Add pointer events utility classes
cat >> src/app/globals.css << 'EOF'

.pointer-events-none { pointer-events: none; }
.pointer-events-auto { pointer-events: auto; }
EOF
git add src/app/globals.css && git commit -m "style: add pointer events utility classes"

# Commit 316: Add resize utility classes
cat >> src/app/globals.css << 'EOF'

.resize-none { resize: none; }
.resize { resize: both; }
.resize-x { resize: horizontal; }
.resize-y { resize: vertical; }
EOF
git add src/app/globals.css && git commit -m "style: add resize utility classes"

# Commit 317: Add user select utility classes
cat >> src/app/globals.css << 'EOF'

.select-none { user-select: none; }
.select-text { user-select: text; }
.select-all { user-select: all; }
.select-auto { user-select: auto; }
EOF
git add src/app/globals.css && git commit -m "style: add user select utility classes"

# Commit 318: Add fill utility classes
cat >> src/app/globals.css << 'EOF'

.fill-current { fill: currentColor; }
.fill-primary { fill: var(--text-primary); }
.fill-secondary { fill: var(--text-secondary); }
.fill-blue { fill: var(--accent-blue); }
.fill-green { fill: var(--accent-green); }
.fill-purple { fill: var(--accent-purple); }
EOF
git add src/app/globals.css && git commit -m "style: add fill utility classes"

# Commit 319: Add stroke utility classes
cat >> src/app/globals.css << 'EOF'

.stroke-current { stroke: currentColor; }
.stroke-primary { stroke: var(--text-primary); }
.stroke-secondary { stroke: var(--text-secondary); }
.stroke-blue { stroke: var(--accent-blue); }
.stroke-green { stroke: var(--accent-green); }
.stroke-purple { stroke: var(--accent-purple); }
EOF
git add src/app/globals.css && git commit -m "style: add stroke utility classes"

# Commit 320: Add table utility classes
cat >> src/app/globals.css << 'EOF'

.table-auto { table-layout: auto; }
.table-fixed { table-layout: fixed; }
.border-collapse { border-collapse: collapse; }
.border-separate { border-separate: separate; }
EOF
git add src/app/globals.css && git commit -m "style: add table utility classes"

# Commit 321: Add object fit utility classes
cat >> src/app/globals.css << 'EOF'

.object-contain { object-fit: contain; }
.object-cover { object-fit: cover; }
.object-fill { object-fit: fill; }
.object-none { object-fit: none; }
.object-scale-down { object-fit: scale-down; }
EOF
git add src/app/globals.css && git commit -m "style: add object fit utility classes"

# Commit 322: Add aspect ratio utility classes
cat >> src/app/globals.css << 'EOF'

.aspect-auto { aspect-ratio: auto; }
.aspect-square { aspect-ratio: 1 / 1; }
.aspect-video { aspect-ratio: 16 / 9; }
EOF
git add src/app/globals.css && git commit -m "style: add aspect ratio utility classes"

# Commit 323: Add columns utility classes
cat >> src/app/globals.css << 'EOF'

.columns-1 { columns: 1; }
.columns-2 { columns: 2; }
.columns-3 { columns: 3; }
.columns-4 { columns: 4; }
EOF
git add src/app/globals.css && git commit -m "style: add columns utility classes"

# Commit 324: Add break utility classes
cat >> src/app/globals.css << 'EOF'

.break-before { break-before: page; }
.break-after { break-after: page; }
.break-inside-avoid { break-inside: avoid; }
EOF
git add src/app/globals.css && git commit -m "style: add break utility classes"

# Commit 325: Add quotes utility classes
cat >> src/app/globals.css << 'EOF'

.quote-none { quotes: none; }
.quote::before { content: open-quote; }
.quote::after { content: close-quote; }
EOF
git add src/app/globals.css && git commit -m "style: add quotes utility classes"

# Commit 326: Add counter utility classes
cat >> src/app/globals.css << 'EOF'

.counter-reset { counter-reset: none; }
.counter-increment { counter-increment: none; }
EOF
git add src/app/globals.css && git commit -m "style: add counter utility classes"

# Commit 327: Add clip path utility classes
cat >> src/app/globals.css << 'EOF'

.clip-none { clip-path: none; }
.clip-circle { clip-path: circle(50%); }
.clip-square { clip-path: inset(0); }
.clip-polygon { clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%); }
EOF
git add src/app/globals.css && git commit -m "style: add clip path utility classes"

# Commit 328: Add mask utility classes
cat >> src/app/globals.css << 'EOF'

.mask-none { mask: none; }
.mask-linear { mask: linear-gradient(black, black); }
.mask-radial { mask: radial-gradient(black, black); }
EOF
git add src/app/globals.css && git commit -m "style: add mask utility classes"

# Commit 329: Add filter utility classes
cat >> src/app/globals.css << 'EOF'

.filter-none { filter: none; }
.filter-blur { filter: blur(4px); }
.filter-brightness { filter: brightness(1.5); }
.filter-contrast { filter: contrast(1.5); }
.filter-grayscale { filter: grayscale(100%); }
.filter-hue-rotate { filter: hue-rotate(90deg); }
.filter-invert { filter: invert(100%); }
.filter-opacity { filter: opacity(50%); }
.filter-saturate { filter: saturate(2); }
.filter-sepia { filter: sepia(100%); }
EOF
git add src/app/globals.css && git commit -m "style: add filter utility classes"

# Commit 330: Add backdrop filter utility classes
cat >> src/app/globals.css << 'EOF'

.backdrop-none { backdrop-filter: none; }
.backdrop-blur { backdrop-filter: blur(8px); }
.backdrop-brightness { backdrop-filter: brightness(1.5); }
.backdrop-contrast { backdrop-filter: contrast(1.5); }
.backdrop-grayscale { backdrop-filter: grayscale(100%); }
.backdrop-hue-rotate { backdrop-filter: hue-rotate(90deg); }
.backdrop-invert { backdrop-filter: invert(100%); }
.backdrop-opacity { backdrop-filter: opacity(50%); }
.backdrop-saturate { backdrop-filter: saturate(2); }
.backdrop-sepia { backdrop-filter: sepia(100%); }
EOF
git add src/app/globals.css && git commit -m "style: add backdrop filter utility classes"

# Commit 331: Add mix blend mode utility classes
cat >> src/app/globals.css << 'EOF'

.blend-normal { mix-blend-mode: normal; }
.blend-multiply { mix-blend-mode: multiply; }
.blend-screen { mix-blend-mode: screen; }
.blend-overlay { mix-blend-mode: overlay; }
.blend-darken { mix-blend-mode: darken; }
.blend-lighten { mix-blend-mode: lighten; }
.blend-color-dodge { mix-blend-mode: color-dodge; }
.blend-color-burn { mix-blend-mode: color-burn; }
.blend-hard-light { mix-blend-mode: hard-light; }
.blend-soft-light { mix-blend-mode: soft-light; }
.blend-difference { mix-blend-mode: difference; }
.blend-exclusion { mix-blend-mode: exclusion; }
.blend-hue { mix-blend-mode: hue; }
.blend-saturation { mix-blend-mode: saturation; }
.blend-color { mix-blend-mode: color; }
.blend-luminosity { mix-blend-mode: luminosity; }
EOF
git add src/app/globals.css && git commit -m "style: add mix blend mode utility classes"

# Commit 332: Add isolation utility classes
cat >> src/app/globals.css << 'EOF'

.isolate { isolation: isolate; }
.isolation-auto { isolation: auto; }
EOF
git add src/app/globals.css && git commit -m "style: add isolation utility classes"

# Commit 333: Add page break utility classes
cat >> src/app/globals.css << 'EOF'

.page-break-auto { page-break-after: auto; }
.page-break-before { page-break-before: always; }
.page-break-after { page-break-after: always; }
.page-break-inside-avoid { page-break-inside: avoid; }
EOF
git add src/app/globals.css && git commit -m "style: add page break utility classes"

# Commit 334: Add orphans utility classes
cat >> src/app/globals.css << 'EOF'

.orphans-1 { orphans: 1; }
.orphans-2 { orphans: 2; }
.orphans-3 { orphans: 3; }
.orphans-4 { orphans: 4; }
EOF
git add src/app/globals.css && git commit -m "style: add orphans utility classes"

# Commit 335: Add widows utility classes
cat >> src/app/globals.css << 'EOF'

.widows-1 { widows: 1; }
.widows-2 { widows: 2; }
.widows-3 { widows: 3; }
.widows-4 { widows: 4; }
EOF
git add src/app/globals.css && git commit -m "style: add widows utility classes"

# Commit 336: Add all utility classes
cat >> src/app/globals.css << 'EOF'

.all-unset { all: unset; }
.all-initial { all: initial; }
.all-inherit { all: inherit; }
.all-revert { all: revert; }
.all-revert-layer { all: revert-layer; }
EOF
git add src/app/globals.css && git commit -m "style: add all property utility classes"

# Commit 337: Add contain utility classes
cat >> src/app/globals.css << 'EOF'

.contain-none { contain: none; }
.contain-size { contain: size; }
.contain-layout { contain: layout; }
.contain-style { contain: style; }
.contain-paint { contain: paint; }
.contain-content { contain: content; }
.contain-strict { contain: strict; }
EOF
git add src/app/globals.css && git commit -m "style: add contain utility classes"

# Commit 338: Add content utility classes
cat >> src/app/globals.css << 'EOF'

.content-none { content: none; }
.content-empty::before { content: ""; }
.content-open::before { content: open-quote; }
.content-close::after { content: close-quote; }
EOF
git add src/app/globals.css && git commit -m "style: add content utility classes"

# Commit 339: Add counter utility classes
cat >> src/app/globals.css << 'EOF'

.counter-reset-list { counter-reset: list-counter 0; }
.counter-increment-list { counter-increment: list-counter 1; }
.counter-list::before { content: counter(list-counter) ". "; }
EOF
git add src/app/globals.css && git commit -m "style: add counter list utility classes"

# Commit 340: Add cursor utility classes for images
cat >> src/app/globals.css << 'EOF'

.cursor-zoom-in { cursor: zoom-in; }
.cursor-zoom-out { cursor: zoom-out; }
.cursor-col-resize { cursor: col-resize; }
.cursor-row-resize { cursor: row-resize; }
.cursor-text { cursor: text; }
.cursor-wait { cursor: wait; }
.cursor-help { cursor: help; }
.cursor-progress { cursor: progress; }
EOF
git add src/app/globals.css && git commit -m "style: add more cursor utility classes"

# Commit 341: Add scroll behavior utility classes
cat >> src/app/globals.css << 'EOF'

.scroll-auto { scroll-behavior: auto; }
.scroll-smooth { scroll-behavior: smooth; }
EOF
git add src/app/globals.css && git commit -m "style: add scroll behavior utility classes"

# Commit 342: Add overscroll behavior utility classes
cat >> src/app/globals.css << 'EOF'

.overscroll-auto { overscroll-behavior: auto; }
.overscroll-contain { overscroll-behavior: contain; }
.overscroll-none { overscroll-behavior: none; }
EOF
git add src/app/globals.css && git commit -m "style: add overscroll behavior utility classes"

# Commit 343: Add snap utility classes
cat >> src/app/globals.css << 'EOF'

.snap-none { scroll-snap-type: none; }
.snap-x { scroll-snap-type: x proximity; }
.snap-y { scroll-snap-type: y proximity; }
.snap-mandatory { scroll-snap-type: mandatory; }
.snap-proximity { scroll-snap-type: proximity; }
.snap-start { scroll-snap-align: start; }
.snap-end { scroll-snap-align: end; }
.snap-center { scroll-snap-align: center; }
.snap-normal { scroll-snap-align: normal; }
.snap-none-align { scroll-snap-align: none; }
EOF
git add src/app/globals.css && git commit -m "style: add snap utility classes"

# Commit 344: Add touch action utility classes
cat >> src/app/globals.css << 'EOF'

.touch-auto { touch-action: auto; }
.touch-none { touch-action: none; }
.touch-pan-x { touch-action: pan-x; }
.touch-pan-y { touch-action: pan-y; }
.touch-pinch-zoom { touch-action: pinch-zoom; }
.touch-manipulation { touch-action: manipulation; }
EOF
git add src/app/globals.css && git commit -m "style: add touch action utility classes"

# Commit 345: Add will change utility classes
cat >> src/app/globals.css << 'EOF'

.will-change-auto { will-change: auto; }
.will-change-scroll { will-change: scroll-position; }
.will-change-contents { will-change: contents; }
.will-change-transform { will-change: transform; }
EOF
git add src/app/globals.css && git commit -m "style: add will change utility classes"

# Commit 346: Add accent color utility classes
cat >> src/app/globals.css << 'EOF'

.accent-auto { accent-color: auto; }
.accent-blue { accent-color: var(--accent-blue); }
.accent-green { accent-color: var(--accent-green); }
.accent-purple { accent-color: var(--accent-purple); }
EOF
git add src/app/globals.css && git commit -m "style: add accent color utility classes"

# Commit 347: Add caret color utility classes
cat >> src/app/globals.css << 'EOF'

.caret-auto { caret-color: auto; }
.caret-blue { caret-color: var(--accent-blue); }
.caret-green { caret-color: var(--accent-green); }
.caret-purple { caret-color: var(--accent-purple); }
EOF
git add src/app/globals.css && git commit -m "style: add caret color utility classes"

# Commit 348: Add scroll margin utility classes
cat >> src/app/globals.css << 'EOF'

.scroll-m-0 { scroll-margin: 0; }
.scroll-m-1 { scroll-margin: 4px; }
.scroll-m-2 { scroll-margin: 8px; }
.scroll-m-3 { scroll-margin: 12px; }
.scroll-m-4 { scroll-margin: 16px; }
.scroll-m-6 { scroll-margin: 24px; }
.scroll-m-8 { scroll-margin: 32px; }
EOF
git add src/app/globals.css && git commit -m "style: add scroll margin utility classes"

# Commit 349: Add scroll padding utility classes
cat >> src/app/globals.css << 'EOF'

.scroll-p-0 { scroll-padding: 0; }
.scroll-p-1 { scroll-padding: 4px; }
.scroll-p-2 { scroll-padding: 8px; }
.scroll-p-3 { scroll-padding: 12px; }
.scroll-p-4 { scroll-padding: 16px; }
.scroll-p-6 { scroll-padding: 24px; }
.scroll-p-8 { scroll-padding: 32px; }
EOF
git add src/app/globals.css && git commit -m "style: add scroll padding utility classes"

# Commit 350: Add text decoration utility classes
cat >> src/app/globals.css << 'EOF'

.underline { text-decoration-line: underline; }
.overline { text-decoration-line: overline; }
.line-through { text-decoration-line: line-through; }
.no-underline { text-decoration-line: none; }
-decoration-solid { text-decoration-style: solid; }
-decoration-double { text-decoration-style: double; }
-decoration-dotted { text-decoration-style: dotted; }
-decoration-dashed { text-decoration-style: dashed; }
-decoration-wavy { text-decoration-style: wavy; }
.underline-offset-auto { text-underline-offset: auto; }
.underline-offset-0 { text-underline-offset: 0px; }
.underline-offset-1 { text-underline-offset: 2px; }
.underline-offset-2 { text-underline-offset: 4px; }
.underline-offset-4 { text-underline-offset: 8px; }
.underline-offset-8 { text-underline-offset: 16px; }
EOF
git add src/app/globals.css && git commit -m "style: add text decoration utility classes"

echo "Phase 13 complete"
