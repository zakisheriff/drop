#!/bin/bash
cd /Users/afraasheriff/Desktop/The_Atom/Atom-Originals/drop/website-demo

# ============================================
# PHASE 11: More micro-changes (commits 218-300)
# ============================================

# Commit 218: Add sitemap.ts
cat > src/app/sitemap.ts << 'EOF'
import type { MetadataRoute } from "next";

export default function sitemap(): MetadataRoute.Sitemap {
  return [
    {
      url: "https://demo.drop.theatom.lk",
      lastModified: new Date(),
      changeFrequency: "monthly",
      priority: 1.0,
    },
  ];
}
EOF
git add src/app/sitemap.ts && git commit -m "feat: add sitemap.ts for demo site"

# Commit 219: Add robots.ts
cat > src/app/robots.ts << 'EOF'
import type { MetadataRoute } from "next";

export default function robots(): MetadataRoute.Robots {
  return {
    rules: {
      userAgent: "*",
      allow: "/",
    },
    sitemap: "https://demo.drop.theatom.lk/sitemap.xml",
  };
}
EOF
git add src/app/robots.ts && git commit -m "feat: add robots.ts for demo site"

# Commit 220: Create lib/utils.ts
cat > src/lib/utils.ts << 'EOF'
export function cn(...classes: (string | undefined | null | false)[]) {
  return classes.filter(Boolean).join(" ");
}
EOF
git add src/lib/utils.ts && git commit -m "feat: create utils.ts with cn helper"

# Commit 221: Add formatDate utility
cat > src/lib/utils.ts << 'EOF'
export function cn(...classes: (string | undefined | null | false)[]) {
  return classes.filter(Boolean).join(" ");
}

export function formatDate(date: Date): string {
  return new Intl.DateTimeFormat("en-US", {
    year: "numeric",
    month: "long",
    day: "numeric",
  }).format(date);
}
EOF
git add src/lib/utils.ts && git commit -m "feat: add formatDate utility function"

# Commit 222: Add truncate utility
cat > src/lib/utils.ts << 'EOF'
export function cn(...classes: (string | undefined | null | false)[]) {
  return classes.filter(Boolean).join(" ");
}

export function formatDate(date: Date): string {
  return new Intl.DateTimeFormat("en-US", {
    year: "numeric",
    month: "long",
    day: "numeric",
  }).format(date);
}

export function truncate(str: string, length: number): string {
  if (str.length <= length) return str;
  return str.slice(0, length) + "...";
}
EOF
git add src/lib/utils.ts && git commit -m "feat: add truncate utility function"

# Commit 223: Create public/file.svg placeholder
cat > public/file.svg << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
  <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m2.25 0H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9Z" />
</svg>
EOF
git add public/file.svg && git commit -m "feat: add file.svg icon to public"

# Commit 224: Add globe.svg
cat > public/globe.svg << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
  <path stroke-linecap="round" stroke-linejoin="round" d="M12 21a9.004 9.004 0 0 0 8.716-6.747M12 21a9.004 9.004 0 0 1-8.716-6.747M12 21c2.485 0 4.5-4.03 4.5-9S14.485 3 12 3m0 18c-2.485 0-4.5-4.03-4.5-9S9.515 3 12 3m0 0a8.997 8.997 0 0 1 7.843 4.582M12 3a8.997 8.997 0 0 0-7.843 4.582m15.686 0A11.953 11.953 0 0 1 12 10.5c-2.998 0-5.74-1.1-7.843-2.918m15.686 0A8.959 8.959 0 0 1 21 12c0 .778-.099 1.533-.284 2.253m0 0A17.919 17.919 0 0 1 12 16.5a17.92 17.92 0 0 1-8.716-2.247m0 0A9.015 9.015 0 0 1 3 12c0-1.605.42-3.113 1.157-4.418" />
</svg>
EOF
git add public/globe.svg && git commit -m "feat: add globe.svg icon to public"

# Commit 225: Add next.svg
cat > public/next.svg << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 180 32">
  <path fill="black" d="M47.36 24.78c2.36 0 4.18-.78 5.46-2.34 1.28-1.56 1.92-3.78 1.92-6.66v-.36h-3.6v.36c0 2.16-.36 3.78-1.08 4.86-.72 1.08-1.8 1.62-3.24 1.62-1.56 0-2.7-.54-3.42-1.62-.72-1.08-1.08-2.7-1.08-4.86v-.36h-3.6v.36c0 2.88.64 5.1 1.92 6.66 1.28 1.56 3.1 2.34 5.46 2.34Zm2.16-11.88c1.32 0 2.34-.48 3.06-1.44.72-.96 1.08-2.34 1.08-4.14v-.36h-3.6v.36c0 1.08-.18 1.86-.54 2.34-.36.48-.9.72-1.56.72-.66 0-1.2-.24-1.56-.72-.36-.48-.54-1.26-.54-2.34v-.36h-3.6v.36c0 1.8.36 3.18 1.08 4.14.72.96 1.74 1.44 3.06 1.44ZM63.48 24.42h3.6v-9.36h-3.6v9.36Zm0-12.42h3.6V9.6h-3.6v2.4ZM70.92 24.42h3.6v-14.4h-3.6v14.4Zm6.84-14.4v14.4h3.6v-9.12c0-1.68.36-2.94 1.08-3.78.72-.84 1.68-1.26 2.88-1.26 1.32 0 2.28.48 2.88 1.44.6.96.9 2.34.9 4.14v8.58h3.6v-9.12c0-1.68.36-2.94 1.08-3.78.72-.84 1.68-1.26 2.88-1.26 1.32 0 2.28.48 2.88 1.44.6.96.9 2.34.9 4.14v8.58h3.6v-9.36c0-2.88-.6-5.1-1.8-6.66-1.2-1.56-2.94-2.34-5.22-2.34-1.56 0-2.88.48-3.96 1.44-1.08.96-1.74 2.22-1.98 3.78h-.12c-.36-1.56-1.08-2.82-2.16-3.78-1.08-.96-2.4-1.44-3.96-1.44-1.56 0-2.88.48-3.96 1.44-1.08.96-1.74 2.22-1.98 3.78h-.12c-.36-1.56-1.08-2.82-2.16-3.78-1.08-.96-2.4-1.44-3.96-1.44-1.8 0-3.24.78-4.32 2.34-1.08 1.56-1.62 3.78-1.62 6.66v.36ZM116.76 24.42h3.6v-9.36h-3.6v9.36Zm0-12.42h3.6V9.6h-3.6v2.4ZM124.2 24.42h3.6v-14.4h-3.6v14.4Zm6.84-14.4v14.4h3.6v-9.12c0-1.68.36-2.94 1.08-3.78.72-.84 1.68-1.26 2.88-1.26 1.32 0 2.28.48 2.88 1.44.6.96.9 2.34.9 4.14v8.58h3.6v-9.12c0-1.68.36-2.94 1.08-3.78.72-.84 1.68-1.26 2.88-1.26 1.32 0 2.28.48 2.88 1.44.6.96.9 2.34.9 4.14v8.58h3.6v-9.36c0-2.88-.6-5.1-1.8-6.66-1.2-1.56-2.94-2.34-5.22-2.34-1.56 0-2.88.48-3.96 1.44-1.08.96-1.74 2.22-1.98 3.78h-.12c-.36-1.56-1.08-2.82-2.16-3.78-1.08-.96-2.4-1.44-3.96-1.44-1.8 0-3.24.78-4.32 2.34-1.08 1.56-1.62 3.78-1.62 6.66v.36ZM156.36 24.78c2.36 0 4.18-.78 5.46-2.34 1.28-1.56 1.92-3.78 1.92-6.66v-.36h-3.6v.36c0 2.16-.36 3.78-1.08 4.86-.72 1.08-1.8 1.62-3.24 1.62-1.56 0-2.7-.54-3.42-1.62-.72-1.08-1.08-2.7-1.08-4.86v-.36h-3.6v.36c0 2.88.64 5.1 1.92 6.66 1.28 1.56 3.1 2.34 5.46 2.34Zm2.16-11.88c1.32 0 2.34-.48 3.06-1.44.72-.96 1.08-2.34 1.08-4.14v-.36h-3.6v.36c0 1.08-.18 1.86-.54 2.34-.36.48-.9.72-1.56.72-.66 0-1.2-.24-1.56-.72-.36-.48-.54-1.26-.54-2.34v-.36h-3.6v.36c0 1.8.36 3.18 1.08 4.14.72.96 1.74 1.44 3.06 1.44ZM165.72 24.42h3.6v-14.4h-3.6v14.4Zm6.84-14.4v14.4h3.6v-9.12c0-1.68.36-2.94 1.08-3.78.72-.84 1.68-1.26 2.88-1.26 1.32 0 2.28.48 2.88 1.44.6.96.9 2.34.9 4.14v8.58h3.6v-9.12c0-1.68.36-2.94 1.08-3.78.72-.84 1.68-1.26 2.88-1.26 1.32 0 2.28.48 2.88 1.44.6.96.9 2.34.9 4.14v8.58h3.6v-9.36c0-2.88-.6-5.1-1.8-6.66-1.2-1.56-2.94-2.34-5.22-2.34-1.56 0-2.88.48-3.96 1.44-1.08.96-1.74 2.22-1.98 3.78h-.12c-.36-1.56-1.08-2.82-2.16-3.78-1.08-.96-2.4-1.44-3.96-1.44-1.8 0-3.24.78-4.32 2.34-1.08 1.56-1.62 3.78-1.62 6.66v.36Z"/>
</svg>
EOF
git add public/next.svg && git commit -m "feat: add next.svg logo to public"

# Commit 226: Add vercel.svg
cat > public/vercel.svg << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 283 64">
  <path fill="black" d="M141 16c-11 0-19 7-19 18s8 18 19 18c6.2 0 11.8-3.4 15-8.4V28h-6.8V41c-1.5 3.5-4.5 5.9-8.2 5.9-5.4 0-9.8-4.4-9.8-9.8 0-5.4 4.4-9.8 9.8-9.8 3.7 0 6.7 2.4 8.2 5.9V16h-6.4zm-7.2 10.2c-2.8 0-5-2.2-5-5s2.2-5 5-5 5 2.2 5 5-2.2 5-5 5zM67 16c-3.4 0-6.3 2.6-6.3 6 0 3.4 2.9 6 6.3 6 3.4 0 6.3-2.6 6.3-6 0-3.4-2.9-6-6.3-6zm0 8.4c-1.4 0-2.3-1-2.3-2.4s.9-2.4 2.3-2.4 2.3 1 2.3 2.4-.9 2.4-2.3 2.4zM90 16c-3.4 0-6.3 2.6-6.3 6 0 3.4 2.9 6 6.3 6 3.4 0 6.3-2.6 6.3-6 0-3.4-2.9-6-6.3-6zm0 8.4c-1.4 0-2.3-1-2.3-2.4s.9-2.4 2.3-2.4 2.3 1 2.3 2.4-.9 2.4-2.3 2.4zM110 28h6.8v14h6.8V28h6.8V22h-20.4v6zM128 16c-3.4 0-6.3 2.6-6.3 6 0 3.4 2.9 6 6.3 6 3.4 0 6.3-2.6 6.3-6 0-3.4-2.9-6-6.3-6zm0 8.4c-1.4 0-2.3-1-2.3-2.4s.9-2.4 2.3-2.4 2.3 1 2.3 2.4-.9 2.4-2.3 2.4zM141 28h6.8v14h6.8V28h6.8V22h-20.4v6zM162 16c-3.4 0-6.3 2.6-6.3 6 0 3.4 2.9 6 6.3 6 3.4 0 6.3-2.6 6.3-6 0-3.4-2.9-6-6.3-6zm0 8.4c-1.4 0-2.3-1-2.3-2.4s.9-2.4 2.3-2.4 2.3 1 2.3 2.4-.9 2.4-2.3 2.4zM183 16c-6.6 0-12 5.4-12 12s5.4 12 12 12c4.8 0 9-2.8 10.9-7h-6.6c-1.1 1.6-3 2.6-4.3 2.6-3 0-5.4-2.4-5.4-5.4h16.8c.1-.6.2-1.2.2-1.8 0-6.6-5.4-12.4-12.6-12.4zm-5.4 9.4c.6-2.8 3-4.6 5.4-4.6 2.4 0 4.8 1.8 5.4 4.6h-10.8zM206 28h6.8v14h6.8V28h6.8V22h-20.4v6zM227 16c-6.6 0-12 5.4-12 12s5.4 12 12 12c4.8 0 9-2.8 10.9-7h-6.6c-1.1 1.6-3 2.6-4.3 2.6-3 0-5.4-2.4-5.4-5.4h16.8c.1-.6.2-1.2.2-1.8 0-6.6-5.4-12.4-12.6-12.4zm-5.4 9.4c.6-2.8 3-4.6 5.4-4.6 2.4 0 4.8 1.8 5.4 4.6h-10.8zM250 16c-3.4 0-6.3 2.6-6.3 6 0 3.4 2.9 6 6.3 6 3.4 0 6.3-2.6 6.3-6 0-3.4-2.9-6-6.3-6zm0 8.4c-1.4 0-2.3-1-2.3-2.4s.9-2.4 2.3-2.4 2.3 1 2.3 2.4-.9 2.4-2.3 2.4zM271 16c-6.6 0-12 5.4-12 12s5.4 12 12 12c4.8 0 9-2.8 10.9-7h-6.6c-1.1 1.6-3 2.6-4.3 2.6-3 0-5.4-2.4-5.4-5.4h16.8c.1-.6.2-1.2.2-1.8 0-6.6-5.4-12.4-12.6-12.4zm-5.4 9.4c.6-2.8 3-4.6 5.4-4.6 2.4 0 4.8 1.8 5.4 4.6h-10.8z"/>
</svg>
EOF
git add public/vercel.svg && git commit -m "feat: add vercel.svg logo to public"

# Commit 227: Add window.svg
cat > public/window.svg << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
  <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 3v11.25A2.25 2.25 0 0 0 6 16.5h2.25M3.75 3h-1.5m1.5 0h16.5m0 0h1.5m-1.5 0v11.25A2.25 2.25 0 0 1 18 16.5h-2.25m-7.5 0h7.5m-7.5 0-1 3m8.5-3 1 3m0 0 .5 1.5m-.5-1.5h-9.5m0 0-.5 1.5m.75-9 3-3 2.148 2.148A12.061 12.061 0 0 1 16.5 7.605" />
</svg>
EOF
git add public/window.svg && git commit -m "feat: add window.svg icon to public"

# ============================================
# More style refinements (commits 228-300)
# ============================================

# Commit 228: Update globals.css - add shadow variables
cat >> src/app/globals.css << 'EOF'

:root {
  --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
  --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1);
  --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1);
  --shadow-xl: 0 20px 25px -5px rgb(0 0 0 / 0.1);
}
EOF
git add src/app/globals.css && git commit -m "style: add shadow css variables"

# Commit 229: Add spacing variables
cat >> src/app/globals.css << 'EOF'

:root {
  --spacing-xs: 4px;
  --spacing-sm: 8px;
  --spacing-md: 16px;
  --spacing-lg: 24px;
  --spacing-xl: 32px;
  --spacing-2xl: 48px;
  --spacing-3xl: 64px;
}
EOF
git add src/app/globals.css && git commit -m "style: add spacing css variables"

# Commit 230: Add border-radius variables
cat >> src/app/globals.css << 'EOF'

:root {
  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 12px;
  --radius-xl: 16px;
  --radius-full: 9999px;
}
EOF
git add src/app/globals.css && git commit -m "style: add border-radius css variables"

# Commit 231: Add transition variables
cat >> src/app/globals.css << 'EOF'

:root {
  --transition-fast: 150ms ease;
  --transition-normal: 200ms ease;
  --transition-slow: 300ms ease;
}
EOF
git add src/app/globals.css && git commit -m "style: add transition css variables"

# Commit 232: Add z-index variables
cat >> src/app/globals.css << 'EOF'

:root {
  --z-dropdown: 50;
  --z-sticky: 100;
  --z-fixed: 200;
  --z-modal: 300;
  --z-tooltip: 400;
}
EOF
git add src/app/globals.css && git commit -m "style: add z-index css variables"

# Commit 233: Add link styles
cat >> src/app/globals.css << 'EOF'

a {
  color: inherit;
  text-decoration: none;
}
EOF
git add src/app/globals.css && git commit -m "style: add base anchor tag styles"

# Commit 234: Add image styles
cat >> src/app/globals.css << 'EOF'

img {
  max-width: 100%;
  height: auto;
  display: block;
}
EOF
git add src/app/globals.css && git commit -m "style: add base image styles"

# Commit 235: Add selection styles
cat >> src/app/globals.css << 'EOF'

::selection {
  background: var(--accent-blue);
  color: #ffffff;
}
EOF
git add src/app/globals.css && git commit -m "style: add text selection highlight styles"

# Commit 236: Add focus styles
cat >> src/app/globals.css << 'EOF'

*:focus-visible {
  outline: 2px solid var(--accent-blue);
  outline-offset: 2px;
}
EOF
git add src/app/globals.css && git commit -m "style: add focus visible outline styles"

# Commit 237: Add scrollbar styles
cat >> src/app/globals.css << 'EOF'

::-webkit-scrollbar {
  width: 8px;
  height: 8px;
}

::-webkit-scrollbar-track {
  background: var(--bg-secondary);
}

::-webkit-scrollbar-thumb {
  background: var(--border-color);
  border-radius: 4px;
}

::-webkit-scrollbar-thumb:hover {
  background: var(--border-hover);
}
EOF
git add src/app/globals.css && git commit -m "style: add custom scrollbar styles"

# Commit 238: Update Navbar - add blog link
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
          <Link href="/blog" className={styles.navLink}>Blog</Link>
          <Link href="/contact" className={styles.navLink}>Contact</Link>
        </div>
      </div>
    </nav>
  );
}
EOF
git add src/components/Navbar.tsx && git commit -m "feat: add Blog navigation link to Navbar"

# Commit 239: Create blog page
mkdir -p src/app/blog
cat > src/app/blog/page.tsx << 'EOF'
"use client";

import React from "react";
EOF
git add src/app/blog/page.tsx && git commit -m "feat: create blog page file"

# Commit 240: Add blog page imports
cat > src/app/blog/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
EOF
git add src/app/blog/page.tsx && git commit -m "feat: add navbar and footer imports to blog page"

# Commit 241: Add blog posts data
cat > src/app/blog/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";

const blogPosts = [
  {
    title: "Getting Started with Drop",
    excerpt: "Learn how to set up and use Drop for instant video downloads.",
    date: "2024-01-15",
    author: "Drop Team",
  },
  {
    title: "Tips for Power Users",
    excerpt: "Advanced techniques to maximize your productivity with Drop.",
    date: "2024-01-10",
    author: "Drop Team",
  },
  {
    title: "What's New in Drop 1.0",
    excerpt: "Explore the latest features and improvements in Drop.",
    date: "2024-01-05",
    author: "Drop Team",
  },
];
EOF
git add src/app/blog/page.tsx && git commit -m "feat: add blog posts data array"

# Commit 242: Add blog page function
cat > src/app/blog/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";

const blogPosts = [
  {
    title: "Getting Started with Drop",
    excerpt: "Learn how to set up and use Drop for instant video downloads.",
    date: "2024-01-15",
    author: "Drop Team",
  },
  {
    title: "Tips for Power Users",
    excerpt: "Advanced techniques to maximize your productivity with Drop.",
    date: "2024-01-10",
    author: "Drop Team",
  },
  {
    title: "What's New in Drop 1.0",
    excerpt: "Explore the latest features and improvements in Drop.",
    date: "2024-01-05",
    author: "Drop Team",
  },
];

export default function BlogPage() {
  return (
    <>
      <Navbar />
      <main>
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/blog/page.tsx && git commit -m "feat: add BlogPage function component"

# Commit 243: Add blog hero
cat > src/app/blog/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";

const blogPosts = [
  {
    title: "Getting Started with Drop",
    excerpt: "Learn how to set up and use Drop for instant video downloads.",
    date: "2024-01-15",
    author: "Drop Team",
  },
  {
    title: "Tips for Power Users",
    excerpt: "Advanced techniques to maximize your productivity with Drop.",
    date: "2024-01-10",
    author: "Drop Team",
  },
  {
    title: "What's New in Drop 1.0",
    excerpt: "Explore the latest features and improvements in Drop.",
    date: "2024-01-05",
    author: "Drop Team",
  },
];

export default function BlogPage() {
  return (
    <>
      <Navbar />
      <main>
        <section className="blog-hero">
          <div className="blog-hero-container">
            <h1>Blog</h1>
            <p>Latest news and updates from Drop</p>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/blog/page.tsx && git commit -m "feat: add blog hero section"

# Commit 244: Add blog grid
cat > src/app/blog/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";

const blogPosts = [
  {
    title: "Getting Started with Drop",
    excerpt: "Learn how to set up and use Drop for instant video downloads.",
    date: "2024-01-15",
    author: "Drop Team",
  },
  {
    title: "Tips for Power Users",
    excerpt: "Advanced techniques to maximize your productivity with Drop.",
    date: "2024-01-10",
    author: "Drop Team",
  },
  {
    title: "What's New in Drop 1.0",
    excerpt: "Explore the latest features and improvements in Drop.",
    date: "2024-01-05",
    author: "Drop Team",
  },
];

export default function BlogPage() {
  return (
    <>
      <Navbar />
      <main>
        <section className="blog-hero">
          <div className="blog-hero-container">
            <h1>Blog</h1>
            <p>Latest news and updates from Drop</p>
          </div>
        </section>
        <section className="blog-content">
          <div className="blog-container">
            <div className="blog-grid">
              {blogPosts.map((post, index) => (
                <article key={index} className="blog-card">
                  <h2>{post.title}</h2>
                  <p>{post.excerpt}</p>
                  <div className="blog-meta">
                    <span>{post.author}</span>
                    <span>{post.date}</span>
                  </div>
                </article>
              ))}
            </div>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/blog/page.tsx && git commit -m "feat: add blog grid with post cards"

# Commit 245: Create blog page.module.css
cat > src/app/blog/page.module.css << 'EOF'
.blog-hero {
  padding: 160px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
  text-align: center;
}

.blog-hero-container {
  max-width: 800px;
  margin: 0 auto;
}

.blog-hero h1 {
  font-size: 3rem;
  font-weight: 700;
  margin-bottom: 16px;
  color: var(--text-primary);
}

.blog-hero p {
  font-size: 1.25rem;
  color: var(--text-secondary);
}

.blog-content {
  padding: 80px 24px;
}

.blog-container {
  max-width: 1200px;
  margin: 0 auto;
}

.blog-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 32px;
}

.blog-card {
  padding: 32px;
  background: var(--bg-primary);
  border-radius: 16px;
  border: 1px solid var(--border-color);
  transition: border-color 0.2s, box-shadow 0.2s;
}

.blog-card:hover {
  border-color: var(--border-hover);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.blog-card h2 {
  font-size: 1.25rem;
  font-weight: 600;
  margin-bottom: 12px;
  color: var(--text-primary);
}

.blog-card p {
  font-size: 0.95rem;
  line-height: 1.6;
  color: var(--text-secondary);
  margin-bottom: 20px;
}

.blog-meta {
  display: flex;
  justify-content: space-between;
  font-size: 0.8rem;
  color: var(--text-secondary);
}

@media (max-width: 768px) {
  .blog-grid {
    grid-template-columns: 1fr;
  }
}
EOF
git add src/app/blog/page.module.css && git commit -m "style: create blog page.module.css"

# Commit 246: Import styles in blog page
cat > src/app/blog/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import styles from "./page.module.css";

const blogPosts = [
  {
    title: "Getting Started with Drop",
    excerpt: "Learn how to set up and use Drop for instant video downloads.",
    date: "2024-01-15",
    author: "Drop Team",
  },
  {
    title: "Tips for Power Users",
    excerpt: "Advanced techniques to maximize your productivity with Drop.",
    date: "2024-01-10",
    author: "Drop Team",
  },
  {
    title: "What's New in Drop 1.0",
    excerpt: "Explore the latest features and improvements in Drop.",
    date: "2024-01-05",
    author: "Drop Team",
  },
];

export default function BlogPage() {
  return (
    <>
      <Navbar />
      <main>
        <section className={styles.blogHero}>
          <div className={styles.blogHeroContainer}>
            <h1>Blog</h1>
            <p>Latest news and updates from Drop</p>
          </div>
        </section>
        <section className={styles.blogContent}>
          <div className={styles.blogContainer}>
            <div className={styles.blogGrid}>
              {blogPosts.map((post, index) => (
                <article key={index} className={styles.blogCard}>
                  <h2>{post.title}</h2>
                  <p>{post.excerpt}</p>
                  <div className={styles.blogMeta}>
                    <span>{post.author}</span>
                    <span>{post.date}</span>
                  </div>
                </article>
              ))}
            </div>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/blog/page.tsx && git commit -m "refactor: import and use CSS module styles in blog page"

echo "Phase 11 complete"
