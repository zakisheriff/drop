#!/bin/bash
cd /Users/afraasheriff/Desktop/The_Atom/Atom-Originals/drop/website-demo

# ============================================
# PHASE 9: FAQ, Newsletter, Stats (commits 163-220)
# ============================================

# Commit 163: Create FAQ.tsx
cat > src/components/FAQ.tsx << 'EOF'
"use client";

import React, { useState } from "react";
EOF
git add src/components/FAQ.tsx && git commit -m "feat: create FAQ component file"

# Commit 164: Add FAQ data
cat > src/components/FAQ.tsx << 'EOF'
"use client";

import React, { useState } from "react";

const faqs = [
  {
    question: "What is Drop?",
    answer: "Drop is a native macOS utility that monitors your clipboard for video links and downloads them instantly with a keyboard shortcut.",
  },
  {
    question: "How do I use Drop?",
    answer: "Simply copy a video link to your clipboard and press Control+D. Drop will automatically detect the link and start downloading the video.",
  },
  {
    question: "What video formats are supported?",
    answer: "Drop supports all major video formats including MP4, WebM, AVI, and more. It downloads videos in the highest available quality.",
  },
  {
    question: "Is Drop free to use?",
    answer: "Yes, Drop is completely free to use. There are no hidden fees or premium features.",
  },
];
EOF
git add src/components/FAQ.tsx && git commit -m "feat: add FAQ data array"

# Commit 165: Add FAQ function
cat > src/components/FAQ.tsx << 'EOF'
"use client";

import React, { useState } from "react";

const faqs = [
  {
    question: "What is Drop?",
    answer: "Drop is a native macOS utility that monitors your clipboard for video links and downloads them instantly with a keyboard shortcut.",
  },
  {
    question: "How do I use Drop?",
    answer: "Simply copy a video link to your clipboard and press Control+D. Drop will automatically detect the link and start downloading the video.",
  },
  {
    question: "What video formats are supported?",
    answer: "Drop supports all major video formats including MP4, WebM, AVI, and more. It downloads videos in the highest available quality.",
  },
  {
    question: "Is Drop free to use?",
    answer: "Yes, Drop is completely free to use. There are no hidden fees or premium features.",
  },
];

export default function FAQ() {
  const [openIndex, setOpenIndex] = useState<number | null>(null);

  return (
    <section className="faq">
    </section>
  );
}
EOF
git add src/components/FAQ.tsx && git commit -m "feat: add FAQ function with useState"

# Commit 166: Add FAQ container
cat > src/components/FAQ.tsx << 'EOF'
"use client";

import React, { useState } from "react";

const faqs = [
  {
    question: "What is Drop?",
    answer: "Drop is a native macOS utility that monitors your clipboard for video links and downloads them instantly with a keyboard shortcut.",
  },
  {
    question: "How do I use Drop?",
    answer: "Simply copy a video link to your clipboard and press Control+D. Drop will automatically detect the link and start downloading the video.",
  },
  {
    question: "What video formats are supported?",
    answer: "Drop supports all major video formats including MP4, WebM, AVI, and more. It downloads videos in the highest available quality.",
  },
  {
    question: "Is Drop free to use?",
    answer: "Yes, Drop is completely free to use. There are no hidden fees or premium features.",
  },
];

export default function FAQ() {
  const [openIndex, setOpenIndex] = useState<number | null>(null);

  return (
    <section className="faq">
      <div className="faq-container">
      </div>
    </section>
  );
}
EOF
git add src/components/FAQ.tsx && git commit -m "style: add FAQ container div"

# Commit 167: Add FAQ header
cat > src/components/FAQ.tsx << 'EOF'
"use client";

import React, { useState } from "react";

const faqs = [
  {
    question: "What is Drop?",
    answer: "Drop is a native macOS utility that monitors your clipboard for video links and downloads them instantly with a keyboard shortcut.",
  },
  {
    question: "How do I use Drop?",
    answer: "Simply copy a video link to your clipboard and press Control+D. Drop will automatically detect the link and start downloading the video.",
  },
  {
    question: "What video formats are supported?",
    answer: "Drop supports all major video formats including MP4, WebM, AVI, and more. It downloads videos in the highest available quality.",
  },
  {
    question: "Is Drop free to use?",
    answer: "Yes, Drop is completely free to use. There are no hidden fees or premium features.",
  },
];

export default function FAQ() {
  const [openIndex, setOpenIndex] = useState<number | null>(null);

  return (
    <section className="faq">
      <div className="faq-container">
        <div className="faq-header">
          <h2 className="faq-title">Frequently Asked Questions</h2>
          <p className="faq-subtitle">Got questions? We've got answers.</p>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/FAQ.tsx && git commit -m "feat: add FAQ section header"

# Commit 168: Add FAQ list
cat > src/components/FAQ.tsx << 'EOF'
"use client";

import React, { useState } from "react";

const faqs = [
  {
    question: "What is Drop?",
    answer: "Drop is a native macOS utility that monitors your clipboard for video links and downloads them instantly with a keyboard shortcut.",
  },
  {
    question: "How do I use Drop?",
    answer: "Simply copy a video link to your clipboard and press Control+D. Drop will automatically detect the link and start downloading the video.",
  },
  {
    question: "What video formats are supported?",
    answer: "Drop supports all major video formats including MP4, WebM, AVI, and more. It downloads videos in the highest available quality.",
  },
  {
    question: "Is Drop free to use?",
    answer: "Yes, Drop is completely free to use. There are no hidden fees or premium features.",
  },
];

export default function FAQ() {
  const [openIndex, setOpenIndex] = useState<number | null>(null);

  return (
    <section className="faq">
      <div className="faq-container">
        <div className="faq-header">
          <h2 className="faq-title">Frequently Asked Questions</h2>
          <p className="faq-subtitle">Got questions? We've got answers.</p>
        </div>
        <div className="faq-list">
          {faqs.map((faq, index) => (
            <div key={index} className="faq-item">
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/FAQ.tsx && git commit -m "feat: add FAQ list with mapping"

# Commit 169: Add FAQ question button
cat > src/components/FAQ.tsx << 'EOF'
"use client";

import React, { useState } from "react";

const faqs = [
  {
    question: "What is Drop?",
    answer: "Drop is a native macOS utility that monitors your clipboard for video links and downloads them instantly with a keyboard shortcut.",
  },
  {
    question: "How do I use Drop?",
    answer: "Simply copy a video link to your clipboard and press Control+D. Drop will automatically detect the link and start downloading the video.",
  },
  {
    question: "What video formats are supported?",
    answer: "Drop supports all major video formats including MP4, WebM, AVI, and more. It downloads videos in the highest available quality.",
  },
  {
    question: "Is Drop free to use?",
    answer: "Yes, Drop is completely free to use. There are no hidden fees or premium features.",
  },
];

export default function FAQ() {
  const [openIndex, setOpenIndex] = useState<number | null>(null);

  return (
    <section className="faq">
      <div className="faq-container">
        <div className="faq-header">
          <h2 className="faq-title">Frequently Asked Questions</h2>
          <p className="faq-subtitle">Got questions? We've got answers.</p>
        </div>
        <div className="faq-list">
          {faqs.map((faq, index) => (
            <div key={index} className="faq-item">
              <button 
                className="faq-question"
                onClick={() => setOpenIndex(openIndex === index ? null : index)}
              >
                <span>{faq.question}</span>
                <span className="faq-icon">{openIndex === index ? "−" : "+"}</span>
              </button>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/FAQ.tsx && git commit -m "feat: add FAQ question toggle button"

# Commit 170: Add FAQ answer
cat > src/components/FAQ.tsx << 'EOF'
"use client";

import React, { useState } from "react";

const faqs = [
  {
    question: "What is Drop?",
    answer: "Drop is a native macOS utility that monitors your clipboard for video links and downloads them instantly with a keyboard shortcut.",
  },
  {
    question: "How do I use Drop?",
    answer: "Simply copy a video link to your clipboard and press Control+D. Drop will automatically detect the link and start downloading the video.",
  },
  {
    question: "What video formats are supported?",
    answer: "Drop supports all major video formats including MP4, WebM, AVI, and more. It downloads videos in the highest available quality.",
  },
  {
    question: "Is Drop free to use?",
    answer: "Yes, Drop is completely free to use. There are no hidden fees or premium features.",
  },
];

export default function FAQ() {
  const [openIndex, setOpenIndex] = useState<number | null>(null);

  return (
    <section className="faq">
      <div className="faq-container">
        <div className="faq-header">
          <h2 className="faq-title">Frequently Asked Questions</h2>
          <p className="faq-subtitle">Got questions? We've got answers.</p>
        </div>
        <div className="faq-list">
          {faqs.map((faq, index) => (
            <div key={index} className="faq-item">
              <button 
                className="faq-question"
                onClick={() => setOpenIndex(openIndex === index ? null : index)}
              >
                <span>{faq.question}</span>
                <span className="faq-icon">{openIndex === index ? "−" : "+"}</span>
              </button>
              {openIndex === index && (
                <div className="faq-answer">
                  <p>{faq.answer}</p>
                </div>
              )}
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/FAQ.tsx && git commit -m "feat: add FAQ answer with conditional rendering"

# Commit 171: Create FAQ.module.css
cat > src/components/FAQ.module.css << 'EOF'
.faq {
  padding: 120px 24px;
  background: var(--bg-secondary);
}
EOF
git add src/components/FAQ.module.css && git commit -m "style: create FAQ.module.css"

# Commit 172: Add FAQ container styles
cat > src/components/FAQ.module.css << 'EOF'
.faq {
  padding: 120px 24px;
  background: var(--bg-secondary);
}

.faq-container {
  max-width: 800px;
  margin: 0 auto;
}
EOF
git add src/components/FAQ.module.css && git commit -m "style: add FAQ container max-width"

# Commit 173: Add FAQ header styles
cat > src/components/FAQ.module.css << 'EOF'
.faq {
  padding: 120px 24px;
  background: var(--bg-secondary);
}

.faq-container {
  max-width: 800px;
  margin: 0 auto;
}

.faq-header {
  text-align: center;
  margin-bottom: 64px;
}

.faq-title {
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 16px;
  color: var(--text-primary);
}

.faq-subtitle {
  font-size: 1.1rem;
  color: var(--text-secondary);
}
EOF
git add src/components/FAQ.module.css && git commit -m "style: add FAQ header and title styles"

# Commit 174: Add FAQ list styles
cat > src/components/FAQ.module.css << 'EOF'
.faq {
  padding: 120px 24px;
  background: var(--bg-secondary);
}

.faq-container {
  max-width: 800px;
  margin: 0 auto;
}

.faq-header {
  text-align: center;
  margin-bottom: 64px;
}

.faq-title {
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 16px;
  color: var(--text-primary);
}

.faq-subtitle {
  font-size: 1.1rem;
  color: var(--text-secondary);
}

.faq-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.faq-item {
  background: var(--bg-primary);
  border-radius: 12px;
  border: 1px solid var(--border-color);
  overflow: hidden;
}
EOF
git add src/components/FAQ.module.css && git commit -m "style: add FAQ list and item styles"

# Commit 175: Add FAQ question styles
cat > src/components/FAQ.module.css << 'EOF'
.faq {
  padding: 120px 24px;
  background: var(--bg-secondary);
}

.faq-container {
  max-width: 800px;
  margin: 0 auto;
}

.faq-header {
  text-align: center;
  margin-bottom: 64px;
}

.faq-title {
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 16px;
  color: var(--text-primary);
}

.faq-subtitle {
  font-size: 1.1rem;
  color: var(--text-secondary);
}

.faq-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.faq-item {
  background: var(--bg-primary);
  border-radius: 12px;
  border: 1px solid var(--border-color);
  overflow: hidden;
}

.faq-question {
  width: 100%;
  padding: 20px 24px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: none;
  border: none;
  cursor: pointer;
  text-align: left;
}

.faq-question span:first-child {
  font-size: 1rem;
  font-weight: 600;
  color: var(--text-primary);
}

.faq-icon {
  font-size: 1.25rem;
  color: var(--text-secondary);
}
EOF
git add src/components/FAQ.module.css && git commit -m "style: add FAQ question button styles"

# Commit 176: Add FAQ answer styles
cat > src/components/FAQ.module.css << 'EOF'
.faq {
  padding: 120px 24px;
  background: var(--bg-secondary);
}

.faq-container {
  max-width: 800px;
  margin: 0 auto;
}

.faq-header {
  text-align: center;
  margin-bottom: 64px;
}

.faq-title {
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 16px;
  color: var(--text-primary);
}

.faq-subtitle {
  font-size: 1.1rem;
  color: var(--text-secondary);
}

.faq-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.faq-item {
  background: var(--bg-primary);
  border-radius: 12px;
  border: 1px solid var(--border-color);
  overflow: hidden;
}

.faq-question {
  width: 100%;
  padding: 20px 24px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: none;
  border: none;
  cursor: pointer;
  text-align: left;
}

.faq-question span:first-child {
  font-size: 1rem;
  font-weight: 600;
  color: var(--text-primary);
}

.faq-icon {
  font-size: 1.25rem;
  color: var(--text-secondary);
}

.faq-answer {
  padding: 0 24px 20px;
}

.faq-answer p {
  font-size: 0.95rem;
  line-height: 1.6;
  color: var(--text-secondary);
}
EOF
git add src/components/FAQ.module.css && git commit -m "style: add FAQ answer text styles"

# Commit 177: Import styles in FAQ
cat > src/components/FAQ.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import styles from "./FAQ.module.css";

const faqs = [
  {
    question: "What is Drop?",
    answer: "Drop is a native macOS utility that monitors your clipboard for video links and downloads them instantly with a keyboard shortcut.",
  },
  {
    question: "How do I use Drop?",
    answer: "Simply copy a video link to your clipboard and press Control+D. Drop will automatically detect the link and start downloading the video.",
  },
  {
    question: "What video formats are supported?",
    answer: "Drop supports all major video formats including MP4, WebM, AVI, and more. It downloads videos in the highest available quality.",
  },
  {
    question: "Is Drop free to use?",
    answer: "Yes, Drop is completely free to use. There are no hidden fees or premium features.",
  },
];

export default function FAQ() {
  const [openIndex, setOpenIndex] = useState<number | null>(null);

  return (
    <section className={styles.faq}>
      <div className={styles.faqContainer}>
        <div className={styles.faqHeader}>
          <h2 className={styles.faqTitle}>Frequently Asked Questions</h2>
          <p className={styles.faqSubtitle}>Got questions? We've got answers.</p>
        </div>
        <div className={styles.faqList}>
          {faqs.map((faq, index) => (
            <div key={index} className={styles.faqItem}>
              <button 
                className={styles.faqQuestion}
                onClick={() => setOpenIndex(openIndex === index ? null : index)}
              >
                <span>{faq.question}</span>
                <span className={styles.faqIcon}>{openIndex === index ? "−" : "+"}</span>
              </button>
              {openIndex === index && (
                <div className={styles.faqAnswer}>
                  <p>{faq.answer}</p>
                </div>
              )}
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/FAQ.tsx && git commit -m "refactor: import and use CSS module styles in FAQ"

# Commit 178: Create Newsletter.tsx
cat > src/components/Newsletter.tsx << 'EOF'
"use client";

import React, { useState } from "react";
EOF
git add src/components/Newsletter.tsx && git commit -m "feat: create Newsletter component file"

# Commit 179: Add Newsletter function
cat > src/components/Newsletter.tsx << 'EOF'
"use client";

import React, { useState } from "react";

export default function Newsletter() {
  const [email, setEmail] = useState("");

  return (
    <section className="newsletter">
    </section>
  );
}
EOF
git add src/components/Newsletter.tsx && git commit -m "feat: add Newsletter function with email state"

# Commit 180: Add newsletter container
cat > src/components/Newsletter.tsx << 'EOF'
"use client";

import React, { useState } from "react";

export default function Newsletter() {
  const [email, setEmail] = useState("");

  return (
    <section className="newsletter">
      <div className="newsletter-container">
      </div>
    </section>
  );
}
EOF
git add src/components/Newsletter.tsx && git commit -m "style: add newsletter container div"

# Commit 181: Add newsletter content
cat > src/components/Newsletter.tsx << 'EOF'
"use client";

import React, { useState } from "react";

export default function Newsletter() {
  const [email, setEmail] = useState("");

  return (
    <section className="newsletter">
      <div className="newsletter-container">
        <div className="newsletter-content">
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/Newsletter.tsx && git commit -m "style: add newsletter content wrapper"

# Commit 182: Add newsletter title
cat > src/components/Newsletter.tsx << 'EOF'
"use client";

import React, { useState } from "react";

export default function Newsletter() {
  const [email, setEmail] = useState("");

  return (
    <section className="newsletter">
      <div className="newsletter-container">
        <div className="newsletter-content">
          <h2 className="newsletter-title">Stay updated</h2>
          <p className="newsletter-subtitle">Get the latest news and updates about Drop</p>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/Newsletter.tsx && git commit -m "feat: add newsletter title and subtitle"

# Commit 183: Add newsletter form
cat > src/components/Newsletter.tsx << 'EOF'
"use client";

import React, { useState } from "react";

export default function Newsletter() {
  const [email, setEmail] = useState("");

  return (
    <section className="newsletter">
      <div className="newsletter-container">
        <div className="newsletter-content">
          <h2 className="newsletter-title">Stay updated</h2>
          <p className="newsletter-subtitle">Get the latest news and updates about Drop</p>
          <form className="newsletter-form">
            <input 
              type="email" 
              placeholder="Enter your email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
            />
            <button type="submit" className="btn-primary">
              Subscribe
            </button>
          </form>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/Newsletter.tsx && git commit -m "feat: add newsletter email form"

# Commit 184: Create Newsletter.module.css
cat > src/components/Newsletter.module.css << 'EOF'
.newsletter {
  padding: 120px 24px;
  background: var(--bg-primary);
  text-align: center;
}
EOF
git add src/components/Newsletter.module.css && git commit -m "style: create Newsletter.module.css"

# Commit 185: Add newsletter container styles
cat > src/components/Newsletter.module.css << 'EOF'
.newsletter {
  padding: 120px 24px;
  background: var(--bg-primary);
  text-align: center;
}

.newsletter-container {
  max-width: 600px;
  margin: 0 auto;
}
EOF
git add src/components/Newsletter.module.css && git commit -m "style: add newsletter container max-width"

# Commit 186: Add newsletter title styles
cat > src/components/Newsletter.module.css << 'EOF'
.newsletter {
  padding: 120px 24px;
  background: var(--bg-primary);
  text-align: center;
}

.newsletter-container {
  max-width: 600px;
  margin: 0 auto;
}

.newsletter-title {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 12px;
  color: var(--text-primary);
}

.newsletter-subtitle {
  font-size: 1rem;
  color: var(--text-secondary);
  margin-bottom: 32px;
}
EOF
git add src/components/Newsletter.module.css && git commit -m "style: add newsletter title and subtitle styles"

# Commit 187: Add newsletter form styles
cat > src/components/Newsletter.module.css << 'EOF'
.newsletter {
  padding: 120px 24px;
  background: var(--bg-primary);
  text-align: center;
}

.newsletter-container {
  max-width: 600px;
  margin: 0 auto;
}

.newsletter-title {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 12px;
  color: var(--text-primary);
}

.newsletter-subtitle {
  font-size: 1rem;
  color: var(--text-secondary);
  margin-bottom: 32px;
}

.newsletter-form {
  display: flex;
  gap: 12px;
  justify-content: center;
}

.newsletter-form input {
  flex: 1;
  max-width: 320px;
  padding: 12px 16px;
  border: 1px solid var(--border-color);
  border-radius: 24px;
  font-size: 0.95rem;
  outline: none;
  transition: border-color 0.2s;
}

.newsletter-form input:focus {
  border-color: var(--accent-blue);
}

@media (max-width: 480px) {
  .newsletter-form {
    flex-direction: column;
  }
  
  .newsletter-form input {
    max-width: 100%;
  }
}
EOF
git add src/components/Newsletter.module.css && git commit -m "style: add newsletter form and input styles"

# Commit 188: Import styles in Newsletter
cat > src/components/Newsletter.tsx << 'EOF'
"use client";

import React, { useState } from "react";
import styles from "./Newsletter.module.css";

export default function Newsletter() {
  const [email, setEmail] = useState("");

  return (
    <section className={styles.newsletter}>
      <div className={styles.newsletterContainer}>
        <div className={styles.newsletterContent}>
          <h2 className={styles.newsletterTitle}>Stay updated</h2>
          <p className={styles.newsletterSubtitle}>Get the latest news and updates about Drop</p>
          <form className={styles.newsletterForm}>
            <input 
              type="email" 
              placeholder="Enter your email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
            />
            <button type="submit" className="btn-primary">
              Subscribe
            </button>
          </form>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/Newsletter.tsx && git commit -m "refactor: import and use CSS module styles in Newsletter"

# Commit 189: Create Stats.tsx
cat > src/components/Stats.tsx << 'EOF'
"use client";

import React from "react";
EOF
git add src/components/Stats.tsx && git commit -m "feat: create Stats component file"

# Commit 190: Add stats data
cat > src/components/Stats.tsx << 'EOF'
"use client";

import React from "react";

const stats = [
  { value: "10K+", label: "Downloads" },
  { value: "4.9", label: "Rating" },
  { value: "50+", label: "Supported Sites" },
  { value: "100%", label: "Free" },
];
EOF
git add src/components/Stats.tsx && git commit -m "feat: add stats data array"

# Commit 191: Add Stats function
cat > src/components/Stats.tsx << 'EOF'
"use client";

import React from "react";

const stats = [
  { value: "10K+", label: "Downloads" },
  { value: "4.9", label: "Rating" },
  { value: "50+", label: "Supported Sites" },
  { value: "100%", label: "Free" },
];

export default function Stats() {
  return (
    <section className="stats">
    </section>
  );
}
EOF
git add src/components/Stats.tsx && git commit -m "feat: add Stats function component"

# Commit 192: Add stats container
cat > src/components/Stats.tsx << 'EOF'
"use client";

import React from "react";

const stats = [
  { value: "10K+", label: "Downloads" },
  { value: "4.9", label: "Rating" },
  { value: "50+", label: "Supported Sites" },
  { value: "100%", label: "Free" },
];

export default function Stats() {
  return (
    <section className="stats">
      <div className="stats-container">
      </div>
    </section>
  );
}
EOF
git add src/components/Stats.tsx && git commit -m "style: add stats container div"

# Commit 193: Add stats grid
cat > src/components/Stats.tsx << 'EOF'
"use client";

import React from "react";

const stats = [
  { value: "10K+", label: "Downloads" },
  { value: "4.9", label: "Rating" },
  { value: "50+", label: "Supported Sites" },
  { value: "100%", label: "Free" },
];

export default function Stats() {
  return (
    <section className="stats">
      <div className="stats-container">
        <div className="stats-grid">
          {stats.map((stat, index) => (
            <div key={index} className="stat-item">
              <span className="stat-value">{stat.value}</span>
              <span className="stat-label">{stat.label}</span>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/Stats.tsx && git commit -m "feat: add stats grid with mapping"

# Commit 194: Create Stats.module.css
cat > src/components/Stats.module.css << 'EOF'
.stats {
  padding: 80px 24px;
  background: var(--bg-secondary);
}
EOF
git add src/components/Stats.module.css && git commit -m "style: create Stats.module.css"

# Commit 195: Add stats container styles
cat > src/components/Stats.module.css << 'EOF'
.stats {
  padding: 80px 24px;
  background: var(--bg-secondary);
}

.stats-container {
  max-width: 1000px;
  margin: 0 auto;
}
EOF
git add src/components/Stats.module.css && git commit -m "style: add stats container max-width"

# Commit 196: Add stats grid styles
cat > src/components/Stats.module.css << 'EOF'
.stats {
  padding: 80px 24px;
  background: var(--bg-secondary);
}

.stats-container {
  max-width: 1000px;
  margin: 0 auto;
}

.stats-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 32px;
  text-align: center;
}

@media (max-width: 768px) {
  .stats-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}
EOF
git add src/components/Stats.module.css && git commit -m "style: add stats grid responsive layout"

# Commit 197: Add stat item styles
cat > src/components/Stats.module.css << 'EOF'
.stats {
  padding: 80px 24px;
  background: var(--bg-secondary);
}

.stats-container {
  max-width: 1000px;
  margin: 0 auto;
}

.stats-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 32px;
  text-align: center;
}

.stat-item {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.stat-value {
  font-size: 2.5rem;
  font-weight: 700;
  color: var(--text-primary);
}

.stat-label {
  font-size: 0.9rem;
  color: var(--text-secondary);
}

@media (max-width: 768px) {
  .stats-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}
EOF
git add src/components/Stats.module.css && git commit -m "style: add stat item and value styles"

# Commit 198: Import styles in Stats
cat > src/components/Stats.tsx << 'EOF'
"use client";

import React from "react";
import styles from "./Stats.module.css";

const stats = [
  { value: "10K+", label: "Downloads" },
  { value: "4.9", label: "Rating" },
  { value: "50+", label: "Supported Sites" },
  { value: "100%", label: "Free" },
];

export default function Stats() {
  return (
    <section className={styles.stats}>
      <div className={styles.statsContainer}>
        <div className={styles.statsGrid}>
          {stats.map((stat, index) => (
            <div key={index} className={styles.statItem}>
              <span className={styles.statValue}>{stat.value}</span>
              <span className={styles.statLabel}>{stat.label}</span>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/Stats.tsx && git commit -m "refactor: import and use CSS module styles in Stats"

echo "Phase 9 complete"
