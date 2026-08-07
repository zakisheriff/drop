#!/bin/bash
cd /Users/afraasheriff/Desktop/The_Atom/Atom-Originals/drop/website-demo

# ============================================
# PHASE 10: CTASection, TeamCard, Pages (commits 199-280)
# ============================================

# Commit 199: Create CTASection.tsx
cat > src/components/CTASection.tsx << 'EOF'
"use client";

import React from "react";
EOF
git add src/components/CTASection.tsx && git commit -m "feat: create CTASection component file"

# Commit 200: Add CTASection function
cat > src/components/CTASection.tsx << 'EOF'
"use client";

import React from "react";

export default function CTASection() {
  return (
    <section className="cta">
    </section>
  );
}
EOF
git add src/components/CTASection.tsx && git commit -m "feat: add CTASection function component"

# Commit 201: Add cta container
cat > src/components/CTASection.tsx << 'EOF'
"use client";

import React from "react";

export default function CTASection() {
  return (
    <section className="cta">
      <div className="cta-container">
      </div>
    </section>
  );
}
EOF
git add src/components/CTASection.tsx && git commit -m "style: add cta container div"

# Commit 202: Add cta content
cat > src/components/CTASection.tsx << 'EOF'
"use client";

import React from "react";

export default function CTASection() {
  return (
    <section className="cta">
      <div className="cta-container">
        <div className="cta-content">
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/CTASection.tsx && git commit -m "style: add cta content wrapper"

# Commit 203: Add cta title
cat > src/components/CTASection.tsx << 'EOF'
"use client";

import React from "react";

export default function CTASection() {
  return (
    <section className="cta">
      <div className="cta-container">
        <div className="cta-content">
          <h2 className="cta-title">Start downloading videos today</h2>
          <p className="cta-subtitle">Join thousands of users who already use Drop</p>
          <button className="btn-primary">Download for macOS</button>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/CTASection.tsx && git commit -m "feat: add cta title subtitle and button"

# Commit 204: Create CTASection.module.css
cat > src/components/CTASection.module.css << 'EOF'
.cta {
  padding: 120px 24px;
  background: linear-gradient(135deg, #0066ff 0%, #7c3aed 100%);
  text-align: center;
}

.cta-container {
  max-width: 800px;
  margin: 0 auto;
}

.cta-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 24px;
}

.cta-title {
  font-size: 2.5rem;
  font-weight: 700;
  color: #ffffff;
}

.cta-subtitle {
  font-size: 1.1rem;
  color: rgba(255, 255, 255, 0.8);
}

.cta .btn-primary {
  background: #ffffff;
  color: #0066ff;
}

.cta .btn-primary:hover {
  background: #f0f0f0;
}
EOF
git add src/components/CTASection.module.css && git commit -m "style: create CTASection.module.css with gradient"

# Commit 205: Import styles in CTASection
cat > src/components/CTASection.tsx << 'EOF'
"use client";

import React from "react";
import styles from "./CTASection.module.css";

export default function CTASection() {
  return (
    <section className={styles.cta}>
      <div className={styles.ctaContainer}>
        <div className={styles.ctaContent}>
          <h2 className={styles.ctaTitle}>Start downloading videos today</h2>
          <p className={styles.ctaSubtitle}>Join thousands of users who already use Drop</p>
          <button className="btn-primary">Download for macOS</button>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/CTASection.tsx && git commit -m "refactor: import and use CSS module styles in CTASection"

# Commit 206: Create TeamCard.tsx
cat > src/components/TeamCard.tsx << 'EOF'
"use client";

import React from "react";
EOF
git add src/components/TeamCard.tsx && git commit -m "feat: create TeamCard component file"

# Commit 207: Add TeamCard interface
cat > src/components/TeamCard.tsx << 'EOF'
"use client";

import React from "react";

interface TeamCardProps {
  name: string;
  role: string;
  avatar: string;
}
EOF
git add src/components/TeamCard.tsx && git commit -m "feat: add TeamCardProps interface"

# Commit 208: Add TeamCard function
cat > src/components/TeamCard.tsx << 'EOF'
"use client";

import React from "react";

interface TeamCardProps {
  name: string;
  role: string;
  avatar: string;
}

export default function TeamCard({ name, role, avatar }: TeamCardProps) {
  return (
    <div className="team-card">
    </div>
  );
}
EOF
git add src/components/TeamCard.tsx && git commit -m "feat: add TeamCard function component"

# Commit 209: Add team avatar
cat > src/components/TeamCard.tsx << 'EOF'
"use client";

import React from "react";

interface TeamCardProps {
  name: string;
  role: string;
  avatar: string;
}

export default function TeamCard({ name, role, avatar }: TeamCardProps) {
  return (
    <div className="team-card">
      <div className="team-avatar">
        <span>{avatar}</span>
      </div>
      <h3 className="team-name">{name}</h3>
      <p className="team-role">{role}</p>
    </div>
  );
}
EOF
git add src/components/TeamCard.tsx && git commit -m "feat: add team avatar name and role"

# Commit 210: Create TeamCard.module.css
cat > src/components/TeamCard.module.css << 'EOF'
.team-card {
  text-align: center;
  padding: 32px;
}

.team-avatar {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  background: var(--bg-secondary);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 2rem;
  margin: 0 auto 16px;
}

.team-name {
  font-size: 1.1rem;
  font-weight: 600;
  color: var(--text-primary);
  margin-bottom: 4px;
}

.team-role {
  font-size: 0.9rem;
  color: var(--text-secondary);
}
EOF
git add src/components/TeamCard.module.css && git commit -m "style: create TeamCard.module.css"

# Commit 211: Import styles in TeamCard
cat > src/components/TeamCard.tsx << 'EOF'
"use client";

import React from "react";
import styles from "./TeamCard.module.css";

interface TeamCardProps {
  name: string;
  role: string;
  avatar: string;
}

export default function TeamCard({ name, role, avatar }: TeamCardProps) {
  return (
    <div className={styles.teamCard}>
      <div className={styles.teamAvatar}>
        <span>{avatar}</span>
      </div>
      <h3 className={styles.teamName}>{name}</h3>
      <p className={styles.teamRole}>{role}</p>
    </div>
  );
}
EOF
git add src/components/TeamCard.tsx && git commit -m "refactor: import and use CSS module styles in TeamCard"

# ============================================
# PAGES (commits 212-280)
# ============================================

# Commit 212: Create page.tsx
cat > src/app/page.tsx << 'EOF'
"use client";

import React from "react";
EOF
git add src/app/page.tsx && git commit -m "feat: create home page file"

# Commit 213: Add page imports
cat > src/app/page.tsx << 'EOF'
"use client";

import React from "react";
import Hero from "@/components/Hero";
import FeaturesSection from "@/components/FeaturesSection";
import Stats from "@/components/Stats";
import TestimonialsSection from "@/components/TestimonialsSection";
import DownloadSection from "@/components/DownloadSection";
import FAQ from "@/components/FAQ";
import Newsletter from "@/components/Newsletter";
import CTASection from "@/components/CTASection";
EOF
git add src/app/page.tsx && git commit -m "feat: add component imports to home page"

# Commit 214: Add page function
cat > src/app/page.tsx << 'EOF'
"use client";

import React from "react";
import Hero from "@/components/Hero";
import FeaturesSection from "@/components/FeaturesSection";
import Stats from "@/components/Stats";
import TestimonialsSection from "@/components/TestimonialsSection";
import DownloadSection from "@/components/DownloadSection";
import FAQ from "@/components/FAQ";
import Newsletter from "@/components/Newsletter";
import CTASection from "@/components/CTASection";

export default function HomePage() {
  return (
    <main>
    </main>
  );
}
EOF
git add src/app/page.tsx && git commit -m "feat: add HomePage function component"

# Commit 215: Add Hero to page
cat > src/app/page.tsx << 'EOF'
"use client";

import React from "react";
import Hero from "@/components/Hero";
import FeaturesSection from "@/components/FeaturesSection";
import Stats from "@/components/Stats";
import TestimonialsSection from "@/components/TestimonialsSection";
import DownloadSection from "@/components/DownloadSection";
import FAQ from "@/components/FAQ";
import Newsletter from "@/components/Newsletter";
import CTASection from "@/components/CTASection";

export default function HomePage() {
  return (
    <main>
      <Hero />
    </main>
  );
}
EOF
git add src/app/page.tsx && git commit -m "feat: add Hero component to home page"

# Commit 216: Add FeaturesSection to page
cat > src/app/page.tsx << 'EOF'
"use client";

import React from "react";
import Hero from "@/components/Hero";
import FeaturesSection from "@/components/FeaturesSection";
import Stats from "@/components/Stats";
import TestimonialsSection from "@/components/TestimonialsSection";
import DownloadSection from "@/components/DownloadSection";
import FAQ from "@/components/FAQ";
import Newsletter from "@/components/Newsletter";
import CTASection from "@/components/CTASection";

export default function HomePage() {
  return (
    <main>
      <Hero />
      <FeaturesSection />
    </main>
  );
}
EOF
git add src/app/page.tsx && git commit -m "feat: add FeaturesSection to home page"

# Commit 217: Add Stats to page
cat > src/app/page.tsx << 'EOF'
"use client";

import React from "react";
import Hero from "@/components/Hero";
import FeaturesSection from "@/components/FeaturesSection";
import Stats from "@/components/Stats";
import TestimonialsSection from "@/components/TestimonialsSection";
import DownloadSection from "@/components/DownloadSection";
import FAQ from "@/components/FAQ";
import Newsletter from "@/components/Newsletter";
import CTASection from "@/components/CTASection";

export default function HomePage() {
  return (
    <main>
      <Hero />
      <FeaturesSection />
      <Stats />
    </main>
  );
}
EOF
git add src/app/page.tsx && git commit -m "feat: add Stats to home page"

# Commit 218: Add TestimonialsSection to page
cat > src/app/page.tsx << 'EOF'
"use client";

import React from "react";
import Hero from "@/components/Hero";
import FeaturesSection from "@/components/FeaturesSection";
import Stats from "@/components/Stats";
import TestimonialsSection from "@/components/TestimonialsSection";
import DownloadSection from "@/components/DownloadSection";
import FAQ from "@/components/FAQ";
import Newsletter from "@/components/Newsletter";
import CTASection from "@/components/CTASection";

export default function HomePage() {
  return (
    <main>
      <Hero />
      <FeaturesSection />
      <Stats />
      <TestimonialsSection />
    </main>
  );
}
EOF
git add src/app/page.tsx && git commit -m "feat: add TestimonialsSection to home page"

# Commit 219: Add DownloadSection to page
cat > src/app/page.tsx << 'EOF'
"use client";

import React from "react";
import Hero from "@/components/Hero";
import FeaturesSection from "@/components/FeaturesSection";
import Stats from "@/components/Stats";
import TestimonialsSection from "@/components/TestimonialsSection";
import DownloadSection from "@/components/DownloadSection";
import FAQ from "@/components/FAQ";
import Newsletter from "@/components/Newsletter";
import CTASection from "@/components/CTASection";

export default function HomePage() {
  return (
    <main>
      <Hero />
      <FeaturesSection />
      <Stats />
      <TestimonialsSection />
      <DownloadSection />
    </main>
  );
}
EOF
git add src/app/page.tsx && git commit -m "feat: add DownloadSection to home page"

# Commit 220: Add FAQ to page
cat > src/app/page.tsx << 'EOF'
"use client";

import React from "react";
import Hero from "@/components/Hero";
import FeaturesSection from "@/components/FeaturesSection";
import Stats from "@/components/Stats";
import TestimonialsSection from "@/components/TestimonialsSection";
import DownloadSection from "@/components/DownloadSection";
import FAQ from "@/components/FAQ";
import Newsletter from "@/components/Newsletter";
import CTASection from "@/components/CTASection";

export default function HomePage() {
  return (
    <main>
      <Hero />
      <FeaturesSection />
      <Stats />
      <TestimonialsSection />
      <DownloadSection />
      <FAQ />
    </main>
  );
}
EOF
git add src/app/page.tsx && git commit -m "feat: add FAQ to home page"

# Commit 221: Add Newsletter to page
cat > src/app/page.tsx << 'EOF'
"use client";

import React from "react";
import Hero from "@/components/Hero";
import FeaturesSection from "@/components/FeaturesSection";
import Stats from "@/components/Stats";
import TestimonialsSection from "@/components/TestimonialsSection";
import DownloadSection from "@/components/DownloadSection";
import FAQ from "@/components/FAQ";
import Newsletter from "@/components/Newsletter";
import CTASection from "@/components/CTASection";

export default function HomePage() {
  return (
    <main>
      <Hero />
      <FeaturesSection />
      <Stats />
      <TestimonialsSection />
      <DownloadSection />
      <FAQ />
      <Newsletter />
    </main>
  );
}
EOF
git add src/app/page.tsx && git commit -m "feat: add Newsletter to home page"

# Commit 222: Add CTASection to page
cat > src/app/page.tsx << 'EOF'
"use client";

import React from "react";
import Hero from "@/components/Hero";
import FeaturesSection from "@/components/FeaturesSection";
import Stats from "@/components/Stats";
import TestimonialsSection from "@/components/TestimonialsSection";
import DownloadSection from "@/components/DownloadSection";
import FAQ from "@/components/FAQ";
import Newsletter from "@/components/Newsletter";
import CTASection from "@/components/CTASection";

export default function HomePage() {
  return (
    <main>
      <Hero />
      <FeaturesSection />
      <Stats />
      <TestimonialsSection />
      <DownloadSection />
      <FAQ />
      <Newsletter />
      <CTASection />
    </main>
  );
}
EOF
git add src/app/page.tsx && git commit -m "feat: add CTASection to home page"

# Commit 223: Create about page
mkdir -p src/app/about
cat > src/app/about/page.tsx << 'EOF'
"use client";

import React from "react";
EOF
git add src/app/about/page.tsx && git commit -m "feat: create about page file"

# Commit 224: Add about page imports
cat > src/app/about/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
EOF
git add src/app/about/page.tsx && git commit -m "feat: add navbar and footer imports to about page"

# Commit 225: Add about page function
cat > src/app/about/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";

export default function AboutPage() {
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
git add src/app/about/page.tsx && git commit -m "feat: add AboutPage function component"

# Commit 226: Add about hero section
cat > src/app/about/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";

export default function AboutPage() {
  return (
    <>
      <Navbar />
      <main>
        <section className="about-hero">
          <div className="about-hero-container">
            <h1>About Drop</h1>
            <p>We're building the simplest way to download videos on macOS</p>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/about/page.tsx && git commit -m "feat: add about hero section"

# Commit 227: Add about content section
cat > src/app/about/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";

export default function AboutPage() {
  return (
    <>
      <Navbar />
      <main>
        <section className="about-hero">
          <div className="about-hero-container">
            <h1>About Drop</h1>
            <p>We're building the simplest way to download videos on macOS</p>
          </div>
        </section>
        <section className="about-content">
          <div className="about-content-container">
            <h2>Our Mission</h2>
            <p>Drop was created with one goal in mind: make downloading videos as simple as possible. No more copying and pasting URLs, no more complicated software.</p>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/about/page.tsx && git commit -m "feat: add about content section with mission"

# Commit 228: Create about page.module.css
cat > src/app/about/page.module.css << 'EOF'
.about-hero {
  padding: 160px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
  text-align: center;
}

.about-hero-container {
  max-width: 800px;
  margin: 0 auto;
}

.about-hero h1 {
  font-size: 3rem;
  font-weight: 700;
  margin-bottom: 16px;
  color: var(--text-primary);
}

.about-hero p {
  font-size: 1.25rem;
  color: var(--text-secondary);
}

.about-content {
  padding: 80px 24px;
}

.about-content-container {
  max-width: 800px;
  margin: 0 auto;
}

.about-content h2 {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 16px;
  color: var(--text-primary);
}

.about-content p {
  font-size: 1.1rem;
  line-height: 1.8;
  color: var(--text-secondary);
}
EOF
git add src/app/about/page.module.css && git commit -m "style: create about page.module.css"

# Commit 229: Import styles in about page
cat > src/app/about/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import styles from "./page.module.css";

export default function AboutPage() {
  return (
    <>
      <Navbar />
      <main>
        <section className={styles.aboutHero}>
          <div className={styles.aboutHeroContainer}>
            <h1>About Drop</h1>
            <p>We're building the simplest way to download videos on macOS</p>
          </div>
        </section>
        <section className={styles.aboutContent}>
          <div className={styles.aboutContentContainer}>
            <h2>Our Mission</h2>
            <p>Drop was created with one goal in mind: make downloading videos as simple as possible. No more copying and pasting URLs, no more complicated software.</p>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/about/page.tsx && git commit -m "refactor: import and use CSS module styles in about page"

# Commit 230: Create features page
mkdir -p src/app/features
cat > src/app/features/page.tsx << 'EOF'
"use client";

import React from "react";
EOF
git add src/app/features/page.tsx && git commit -m "feat: create features page file"

# Commit 231: Add features page imports
cat > src/app/features/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import FeaturesSection from "@/components/FeaturesSection";
import Footer from "@/components/Footer";
EOF
git add src/app/features/page.tsx && git commit -m "feat: add navbar featuressection and footer imports"

# Commit 232: Add features page function
cat > src/app/features/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import FeaturesSection from "@/components/FeaturesSection";
import Footer from "@/components/Footer";

export default function FeaturesPage() {
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
git add src/app/features/page.tsx && git commit -m "feat: add FeaturesPage function component"

# Commit 233: Add features hero
cat > src/app/features/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import FeaturesSection from "@/components/FeaturesSection";
import Footer from "@/components/Footer";

export default function FeaturesPage() {
  return (
    <>
      <Navbar />
      <main>
        <section className="features-hero">
          <div className="features-hero-container">
            <h1>Features</h1>
            <p>Everything you need to download videos instantly</p>
          </div>
        </section>
        <FeaturesSection />
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/features/page.tsx && git commit -m "feat: add features hero section"

# Commit 234: Create features page.module.css
cat > src/app/features/page.module.css << 'EOF'
.features-hero {
  padding: 160px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
  text-align: center;
}

.features-hero-container {
  max-width: 800px;
  margin: 0 auto;
}

.features-hero h1 {
  font-size: 3rem;
  font-weight: 700;
  margin-bottom: 16px;
  color: var(--text-primary);
}

.features-hero p {
  font-size: 1.25rem;
  color: var(--text-secondary);
}
EOF
git add src/app/features/page.module.css && git commit -m "style: create features page.module.css"

# Commit 235: Import styles in features page
cat > src/app/features/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import FeaturesSection from "@/components/FeaturesSection";
import Footer from "@/components/Footer";
import styles from "./page.module.css";

export default function FeaturesPage() {
  return (
    <>
      <Navbar />
      <main>
        <section className={styles.featuresHero}>
          <div className={styles.featuresHeroContainer}>
            <h1>Features</h1>
            <p>Everything you need to download videos instantly</p>
          </div>
        </section>
        <FeaturesSection />
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/features/page.tsx && git commit -m "refactor: import and use CSS module styles in features page"

# Commit 236: Create download page
mkdir -p src/app/download
cat > src/app/download/page.tsx << 'EOF'
"use client";

import React from "react";
EOF
git add src/app/download/page.tsx && git commit -m "feat: create download page file"

# Commit 237: Add download page imports
cat > src/app/download/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import DownloadSection from "@/components/DownloadSection";
import Footer from "@/components/Footer";
EOF
git add src/app/download/page.tsx && git commit -m "feat: add navbar downloadsection and footer imports"

# Commit 238: Add download page function
cat > src/app/download/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import DownloadSection from "@/components/DownloadSection";
import Footer from "@/components/Footer";

export default function DownloadPage() {
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
git add src/app/download/page.tsx && git commit -m "feat: add DownloadPage function component"

# Commit 239: Add download hero
cat > src/app/download/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import DownloadSection from "@/components/DownloadSection";
import Footer from "@/components/Footer";

export default function DownloadPage() {
  return (
    <>
      <Navbar />
      <main>
        <section className="download-hero">
          <div className="download-hero-container">
            <h1>Download Drop</h1>
            <p>Get started with Drop for macOS</p>
          </div>
        </section>
        <DownloadSection />
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/download/page.tsx && git commit -m "feat: add download hero section"

# Commit 240: Create download page.module.css
cat > src/app/download/page.module.css << 'EOF'
.download-hero {
  padding: 160px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
  text-align: center;
}

.download-hero-container {
  max-width: 800px;
  margin: 0 auto;
}

.download-hero h1 {
  font-size: 3rem;
  font-weight: 700;
  margin-bottom: 16px;
  color: var(--text-primary);
}

.download-hero p {
  font-size: 1.25rem;
  color: var(--text-secondary);
}
EOF
git add src/app/download/page.module.css && git commit -m "style: create download page.module.css"

# Commit 241: Import styles in download page
cat > src/app/download/page.tsx << 'EOF'
"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import DownloadSection from "@/components/DownloadSection";
import Footer from "@/components/Footer";
import styles from "./page.module.css";

export default function DownloadPage() {
  return (
    <>
      <Navbar />
      <main>
        <section className={styles.downloadHero}>
          <div className={styles.downloadHeroContainer}>
            <h1>Download Drop</h1>
            <p>Get started with Drop for macOS</p>
          </div>
        </section>
        <DownloadSection />
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/download/page.tsx && git commit -m "refactor: import and use CSS module styles in download page"

# Commit 242: Create contact page
mkdir -p src/app/contact
cat > src/app/contact/page.tsx << 'EOF'
"use client";

import React, { useState } from "react";
EOF
git add src/app/contact/page.tsx && git commit -m "feat: create contact page file"

# Commit 243: Add contact page imports
cat > src/app/contact/page.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
EOF
git add src/app/contact/page.tsx && git commit -m "feat: add navbar and footer imports to contact page"

# Commit 244: Add contact form state
cat > src/app/contact/page.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";

export default function ContactPage() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [message, setMessage] = useState("");

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
git add src/app/contact/page.tsx && git commit -m "feat: add contact form state variables"

# Commit 245: Add contact hero
cat > src/app/contact/page.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";

export default function ContactPage() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [message, setMessage] = useState("");

  return (
    <>
      <Navbar />
      <main>
        <section className="contact-hero">
          <div className="contact-hero-container">
            <h1>Contact Us</h1>
            <p>Have questions? We'd love to hear from you.</p>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/contact/page.tsx && git commit -m "feat: add contact hero section"

# Commit 246: Add contact form
cat > src/app/contact/page.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";

export default function ContactPage() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [message, setMessage] = useState("");

  return (
    <>
      <Navbar />
      <main>
        <section className="contact-hero">
          <div className="contact-hero-container">
            <h1>Contact Us</h1>
            <p>Have questions? We'd love to hear from you.</p>
          </div>
        </section>
        <section className="contact-form-section">
          <div className="contact-form-container">
            <form className="contact-form">
              <div className="form-group">
                <label htmlFor="name">Name</label>
                <input 
                  type="text" 
                  id="name"
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                />
              </div>
              <div className="form-group">
                <label htmlFor="email">Email</label>
                <input 
                  type="email" 
                  id="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                />
              </div>
              <div className="form-group">
                <label htmlFor="message">Message</label>
                <textarea 
                  id="message"
                  value={message}
                  onChange={(e) => setMessage(e.target.value)}
                />
              </div>
              <button type="submit" className="btn-primary">Send Message</button>
            </form>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/contact/page.tsx && git commit -m "feat: add contact form with input fields"

# Commit 247: Create contact page.module.css
cat > src/app/contact/page.module.css << 'EOF'
.contact-hero {
  padding: 160px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
  text-align: center;
}

.contact-hero-container {
  max-width: 800px;
  margin: 0 auto;
}

.contact-hero h1 {
  font-size: 3rem;
  font-weight: 700;
  margin-bottom: 16px;
  color: var(--text-primary);
}

.contact-hero p {
  font-size: 1.25rem;
  color: var(--text-secondary);
}

.contact-form-section {
  padding: 80px 24px;
}

.contact-form-container {
  max-width: 600px;
  margin: 0 auto;
}

.contact-form {
  display: flex;
  flex-direction: column;
  gap: 24px;
}

.form-group {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.form-group label {
  font-size: 0.9rem;
  font-weight: 600;
  color: var(--text-primary);
}

.form-group input,
.form-group textarea {
  padding: 12px 16px;
  border: 1px solid var(--border-color);
  border-radius: 8px;
  font-size: 1rem;
  outline: none;
  transition: border-color 0.2s;
}

.form-group input:focus,
.form-group textarea:focus {
  border-color: var(--accent-blue);
}

.form-group textarea {
  min-height: 150px;
  resize: vertical;
}
EOF
git add src/app/contact/page.module.css && git commit -m "style: create contact page.module.css"

# Commit 248: Import styles in contact page
cat > src/app/contact/page.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import styles from "./page.module.css";

export default function ContactPage() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [message, setMessage] = useState("");

  return (
    <>
      <Navbar />
      <main>
        <section className={styles.contactHero}>
          <div className={styles.contactHeroContainer}>
            <h1>Contact Us</h1>
            <p>Have questions? We'd love to hear from you.</p>
          </div>
        </section>
        <section className={styles.contactFormSection}>
          <div className={styles.contactFormContainer}>
            <form className={styles.contactForm}>
              <div className={styles.formGroup}>
                <label htmlFor="name">Name</label>
                <input 
                  type="text" 
                  id="name"
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                />
              </div>
              <div className={styles.formGroup}>
                <label htmlFor="email">Email</label>
                <input 
                  type="email" 
                  id="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                />
              </div>
              <div className={styles.formGroup}>
                <label htmlFor="message">Message</label>
                <textarea 
                  id="message"
                  value={message}
                  onChange={(e) => setMessage(e.target.value)}
                />
              </div>
              <button type="submit" className="btn-primary">Send Message</button>
            </form>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/contact/page.tsx && git commit -m "refactor: import and use CSS module styles in contact page"

echo "Phase 10 complete"
