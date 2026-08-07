#!/bin/bash
cd /Users/afraasheriff/Desktop/The_Atom/Atom-Originals/drop/website-demo

# ============================================
# PHASE 12: More animations and responsive (commits 247-350)
# ============================================

# Commit 247: Add fadeIn animation
cat >> src/app/globals.css << 'EOF'

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
EOF
git add src/app/globals.css && git commit -m "style: add fadeIn keyframe animation"

# Commit 248: Add slideUp animation
cat >> src/app/globals.css << 'EOF'

@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
EOF
git add src/app/globals.css && git commit -m "style: add slideUp keyframe animation"

# Commit 249: Add slideDown animation
cat >> src/app/globals.css << 'EOF'

@keyframes slideDown {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
EOF
git add src/app/globals.css && git commit -m "style: add slideDown keyframe animation"

# Commit 250: Add scaleIn animation
cat >> src/app/globals.css << 'EOF'

@keyframes scaleIn {
  from {
    opacity: 0;
    transform: scale(0.95);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}
EOF
git add src/app/globals.css && git commit -m "style: add scaleIn keyframe animation"

# Commit 251: Add pulse animation
cat >> src/app/globals.css << 'EOF'

@keyframes pulse {
  0%, 100% {
    opacity: 1;
  }
  50% {
    opacity: 0.5;
  }
}
EOF
git add src/app/globals.css && git commit -m "style: add pulse keyframe animation"

# Commit 252: Add spin animation
cat >> src/app/globals.css << 'EOF'

@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
EOF
git add src/app/globals.css && git commit -m "style: add spin keyframe animation"

# Commit 253: Add bounce animation
cat >> src/app/globals.css << 'EOF'

@keyframes bounce {
  0%, 100% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-10px);
  }
}
EOF
git add src/app/globals.css && git commit -m "style: add bounce keyframe animation"

# Commit 254: Update Hero - add animation
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
git add src/components/Hero.module.css && git commit -m "style: add staggered animations to Hero component"

# Commit 255: Update FeatureCard - add hover animation
cat > src/components/FeatureCard.module.css << 'EOF'
.feature-card {
  padding: 32px;
  background: var(--bg-primary);
  border-radius: 16px;
  border: 1px solid var(--border-color);
  transition: border-color 0.2s, box-shadow 0.2s, transform 0.2s;
}

.feature-card:hover {
  border-color: var(--border-hover);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
  transform: translateY(-4px);
}

.feature-icon {
  width: 48px;
  height: 48px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: var(--bg-secondary);
  border-radius: 12px;
  margin-bottom: 20px;
  font-size: 1.5rem;
  transition: transform 0.2s;
}

.feature-card:hover .feature-icon {
  transform: scale(1.1);
}

.feature-title {
  font-size: 1.25rem;
  font-weight: 600;
  margin-bottom: 12px;
  color: var(--text-primary);
}

.feature-description {
  font-size: 0.95rem;
  line-height: 1.6;
  color: var(--text-secondary);
}
EOF
git add src/components/FeatureCard.module.css && git commit -m "style: add hover lift animation to FeatureCard"

# Commit 256: Update Navbar - add animation
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
  animation: slideDown 0.3s ease-out;
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
  position: relative;
}

.nav-link::after {
  content: "";
  position: absolute;
  bottom: -4px;
  left: 0;
  width: 0;
  height: 2px;
  background: var(--accent-blue);
  transition: width 0.2s;
}

.nav-link:hover {
  color: var(--text-primary);
}

.nav-link:hover::after {
  width: 100%;
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
git add src/components/Navbar.module.css && git commit -m "style: add underline hover animation to Navbar links"

# Commit 257: Update TestimonialCard - add hover
cat > src/components/TestimonialCard.module.css << 'EOF'
.testimonial-card {
  padding: 32px;
  background: var(--bg-primary);
  border-radius: 16px;
  border: 1px solid var(--border-color);
  transition: border-color 0.2s, box-shadow 0.2s, transform 0.2s;
}

.testimonial-card:hover {
  border-color: var(--border-hover);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
  transform: translateY(-2px);
}

.testimonial-avatar {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  background: var(--bg-secondary);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5rem;
  margin-bottom: 16px;
}

.testimonial-content {
  font-size: 1rem;
  line-height: 1.6;
  color: var(--text-primary);
  margin-bottom: 20px;
  font-style: italic;
}

.testimonial-author {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.testimonial-name {
  font-size: 0.9rem;
  font-weight: 600;
  color: var(--text-primary);
}

.testimonial-role {
  font-size: 0.8rem;
  color: var(--text-secondary);
}
EOF
git add src/components/TestimonialCard.module.css && git commit -m "style: add hover animation and italic quote to TestimonialCard"

# Commit 258: Update FAQ - add transition
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
  transition: border-color 0.2s;
}

.faq-item:hover {
  border-color: var(--border-hover);
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
  transition: transform 0.2s;
}

.faq-answer {
  padding: 0 24px 20px;
  animation: slideDown 0.3s ease-out;
}

.faq-answer p {
  font-size: 0.95rem;
  line-height: 1.6;
  color: var(--text-secondary);
}
EOF
git add src/components/FAQ.module.css && git commit -m "style: add slideDown animation to FAQ answer"

# Commit 259: Update DownloadSection - add animation
cat > src/components/DownloadSection.module.css << 'EOF'
.download {
  padding: 120px 24px;
  text-align: center;
  animation: fadeIn 0.6s ease-out;
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
git add src/components/DownloadSection.module.css && git commit -m "style: add fadeIn animation to DownloadSection"

# Commit 260: Update Newsletter - add hover
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
  transition: border-color 0.2s, box-shadow 0.2s;
}

.newsletter-form input:focus {
  border-color: var(--accent-blue);
  box-shadow: 0 0 0 3px rgba(0, 102, 255, 0.1);
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
git add src/components/Newsletter.module.css && git commit -m "style: add focus glow to Newsletter input"

# Commit 261: Update Stats - add animation
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
  padding: 24px;
  border-radius: 12px;
  transition: background-color 0.2s;
}

.stat-item:hover {
  background: var(--bg-primary);
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
git add src/components/Stats.module.css && git commit -m "style: add hover background to Stats items"

# Commit 262: Update CTASection - add hover
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
  transition: background-color 0.2s, transform 0.2s;
}

.cta .btn-primary:hover {
  background: #f0f0f0;
  transform: translateY(-2px);
}

.cta .btn-primary:active {
  transform: translateY(0);
}
EOF
git add src/components/CTASection.module.css && git commit -m "style: add hover lift to CTASection button"

# Commit 263: Update Footer - add hover
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
  transition: color 0.2s, transform 0.2s;
  display: inline-block;
}

.footer-link:hover {
  color: var(--text-primary);
  transform: translateX(4px);
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
git add src/components/Footer.module.css && git commit -m "style: add slide right hover to Footer links"

# Commit 264: Update About page - add more content
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
            <p>We believe that technology should make your life easier, not more complicated. That's why we built Drop to work seamlessly in the background, ready whenever you need it.</p>
          </div>
        </section>
        <section className={styles.aboutValues}>
          <div className={styles.aboutValuesContainer}>
            <h2>Our Values</h2>
            <div className={styles.valuesGrid}>
              <div className={styles.valueItem}>
                <h3>Simplicity</h3>
                <p>We believe in keeping things simple. Drop does one thing and does it well.</p>
              </div>
              <div className={styles.valueItem}>
                <h3>Quality</h3>
                <p>We never compromise on quality. Drop downloads videos in the highest available resolution.</p>
              </div>
              <div className={styles.valueItem}>
                <h3>Privacy</h3>
                <p>Your data stays on your device. Drop doesn't collect or share any personal information.</p>
              </div>
            </div>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/about/page.tsx && git commit -m "feat: add values section to About page"

# Commit 265: Update about page.module.css
cat > src/app/about/page.module.css << 'EOF'
.about-hero {
  padding: 160px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
  text-align: center;
  animation: fadeIn 0.6s ease-out;
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
  margin-bottom: 16px;
}

.about-values {
  padding: 80px 24px;
  background: var(--bg-secondary);
}

.about-values-container {
  max-width: 1000px;
  margin: 0 auto;
}

.about-values h2 {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 48px;
  text-align: center;
  color: var(--text-primary);
}

.valuesGrid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 32px;
}

.valueItem {
  padding: 32px;
  background: var(--bg-primary);
  border-radius: 16px;
  border: 1px solid var(--border-color);
}

.valueItem h3 {
  font-size: 1.25rem;
  font-weight: 600;
  margin-bottom: 12px;
  color: var(--text-primary);
}

.valueItem p {
  font-size: 0.95rem;
  line-height: 1.6;
  color: var(--text-secondary);
}

@media (max-width: 768px) {
  .valuesGrid {
    grid-template-columns: 1fr;
  }
}
EOF
git add src/app/about/page.module.css && git commit -m "style: add values section styles to About page"

# Commit 266: Update Contact page - add success state
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
  const [submitted, setSubmitted] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setSubmitted(true);
  };

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
            {submitted ? (
              <div className={styles.successMessage}>
                <h2>Thank you!</h2>
                <p>Your message has been sent. We'll get back to you soon.</p>
              </div>
            ) : (
              <form className={styles.contactForm} onSubmit={handleSubmit}>
                <div className={styles.formGroup}>
                  <label htmlFor="name">Name</label>
                  <input 
                    type="text" 
                    id="name"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    required
                  />
                </div>
                <div className={styles.formGroup}>
                  <label htmlFor="email">Email</label>
                  <input 
                    type="email" 
                    id="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    required
                  />
                </div>
                <div className={styles.formGroup}>
                  <label htmlFor="message">Message</label>
                  <textarea 
                    id="message"
                    value={message}
                    onChange={(e) => setMessage(e.target.value)}
                    required
                  />
                </div>
                <button type="submit" className="btn-primary">Send Message</button>
              </form>
            )}
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/contact/page.tsx && git commit -m "feat: add form submission state to Contact page"

# Commit 267: Update contact page.module.css
cat > src/app/contact/page.module.css << 'EOF'
.contact-hero {
  padding: 160px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
  text-align: center;
  animation: fadeIn 0.6s ease-out;
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
  transition: border-color 0.2s, box-shadow 0.2s;
}

.form-group input:focus,
.form-group textarea:focus {
  border-color: var(--accent-blue);
  box-shadow: 0 0 0 3px rgba(0, 102, 255, 0.1);
}

.form-group textarea {
  min-height: 150px;
  resize: vertical;
}

.successMessage {
  text-align: center;
  padding: 48px;
  background: var(--bg-secondary);
  border-radius: 16px;
}

.successMessage h2 {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 16px;
  color: var(--accent-green);
}

.successMessage p {
  font-size: 1.1rem;
  color: var(--text-secondary);
}
EOF
git add src/app/contact/page.module.css && git commit -m "style: add success message styles to Contact page"

# Commit 268: Update Features page - add more features
cat > src/components/FeaturesSection.tsx << 'EOF'
"use client";

import React from "react";
import FeatureCard from "./FeatureCard";
import styles from "./FeaturesSection.module.css";

const features = [
  {
    icon: "⚡",
    title: "Instant Downloads",
    description: "Download videos instantly with a single keyboard shortcut. No more copy-pasting URLs.",
  },
  {
    icon: "🎯",
    title: "Smart Detection",
    description: "Automatically detects video links in your clipboard and prepares them for download.",
  },
  {
    icon: "✨",
    title: "Highest Quality",
    description: "Downloads videos in the highest available quality, up to 4K resolution.",
  },
  {
    icon: "🔒",
    title: "Privacy First",
    description: "Your data stays on your device. We don't collect or share any personal information.",
  },
  {
    icon: "🌐",
    title: "Wide Support",
    description: "Supports over 50 popular video sites including YouTube, Vimeo, and more.",
  },
  {
    icon: "📱",
    title: "Lightweight",
    description: "Minimal resource usage. Drop runs silently in the background without slowing down your Mac.",
  },
];

export default function FeaturesSection() {
  return (
    <section className={styles.features}>
      <div className={styles.featuresContainer}>
        <div className={styles.featuresHeader}>
          <h2 className={styles.featuresTitle}>Features</h2>
          <p className={styles.featuresSubtitle}>Everything you need to download videos instantly</p>
        </div>
        <div className={styles.featuresGrid}>
          {features.map((feature, index) => (
            <FeatureCard
              key={index}
              icon={feature.icon}
              title={feature.title}
              description={feature.description}
            />
          ))}
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/FeaturesSection.tsx && git commit -m "feat: add three more features to FeaturesSection"

# Commit 269: Update FeaturesSection grid for 6 items
cat > src/components/FeaturesSection.module.css << 'EOF'
.features {
  padding: 120px 24px;
  background: var(--bg-secondary);
}

.features-container {
  max-width: 1200px;
  margin: 0 auto;
}

.features-header {
  text-align: center;
  margin-bottom: 64px;
}

.features-title {
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 16px;
  color: var(--text-primary);
}

.features-subtitle {
  font-size: 1.1rem;
  color: var(--text-secondary);
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 32px;
}

@media (max-width: 1024px) {
  .features-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 640px) {
  .features-grid {
    grid-template-columns: 1fr;
  }
}
EOF
git add src/components/FeaturesSection.module.css && git commit -m "style: add tablet breakpoint to features grid"

# Commit 270: Update Testimonials - add more
cat > src/components/TestimonialsSection.tsx << 'EOF'
"use client";

import React from "react";
import TestimonialCard from "./TestimonialCard";
import styles from "./TestimonialsSection.module.css";

const testimonials = [
  {
    name: "John Doe",
    role: "Content Creator",
    content: "Drop has completely changed how I save videos. It's so fast and easy!",
    avatar: "👤",
  },
  {
    name: "Jane Smith",
    role: "Video Editor",
    content: "The quality of downloads is amazing. I use it every day for my work.",
    avatar: "👩",
  },
  {
    name: "Mike Johnson",
    role: "Student",
    content: "Best tool for saving lecture videos. Simple and reliable.",
    avatar: "👨",
  },
  {
    name: "Sarah Wilson",
    role: "YouTuber",
    content: "I use Drop to save inspiration videos. Works perfectly every time!",
    avatar: "👩‍🎨",
  },
  {
    name: "David Brown",
    role: "Designer",
    content: "Finally a tool that just works. No bloat, no ads, just downloads.",
    avatar: "👨‍💻",
  },
  {
    name: "Emily Davis",
    role: "Researcher",
    content: "Drop helps me save academic videos for later reference. Essential tool!",
    avatar: "👩‍🔬",
  },
];

export default function TestimonialsSection() {
  return (
    <section className={styles.testimonials}>
      <div className={styles.testimonialsContainer}>
        <div className={styles.testimonialsHeader}>
          <h2 className={styles.testimonialsTitle}>What users say</h2>
          <p className={styles.testimonialsSubtitle}>Trusted by thousands of users worldwide</p>
        </div>
        <div className={styles.testimonialsGrid}>
          {testimonials.map((testimonial, index) => (
            <TestimonialCard
              key={index}
              name={testimonial.name}
              role={testimonial.role}
              content={testimonial.content}
              avatar={testimonial.avatar}
            />
          ))}
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/TestimonialsSection.tsx && git commit -m "feat: add three more testimonials to TestimonialsSection"

# Commit 271: Update TestimonialsSection grid for 6 items
cat > src/components/TestimonialsSection.module.css << 'EOF'
.testimonials {
  padding: 120px 24px;
  background: var(--bg-primary);
}

.testimonials-container {
  max-width: 1200px;
  margin: 0 auto;
}

.testimonials-header {
  text-align: center;
  margin-bottom: 64px;
}

.testimonials-title {
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 16px;
  color: var(--text-primary);
}

.testimonials-subtitle {
  font-size: 1.1rem;
  color: var(--text-secondary);
}

.testimonials-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 32px;
}

@media (max-width: 1024px) {
  .testimonials-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 640px) {
  .testimonials-grid {
    grid-template-columns: 1fr;
  }
}
EOF
git add src/components/TestimonialsSection.module.css && git commit -m "style: add tablet breakpoint to testimonials grid"

# Commit 272: Update FAQ - add more questions
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
  {
    question: "Does Drop work with YouTube?",
    answer: "Yes! Drop works with YouTube and over 50 other popular video sites. We're constantly adding support for more platforms.",
  },
  {
    question: "Is my data safe?",
    answer: "Absolutely. Drop runs entirely on your device and doesn't send any data to external servers. Your privacy is our priority.",
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
git add src/components/FAQ.tsx && git commit -m "feat: add two more FAQ questions"

# Commit 273: Update blog page - add more posts
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
  {
    title: "Supported Video Sites",
    excerpt: "A complete list of all video sites supported by Drop.",
    date: "2024-01-01",
    author: "Drop Team",
  },
  {
    title: "Troubleshooting Common Issues",
    excerpt: "Solutions to the most common problems users encounter.",
    date: "2023-12-28",
    author: "Drop Team",
  },
  {
    title: "The Future of Drop",
    excerpt: "A look at what's coming next for Drop.",
    date: "2023-12-20",
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
git add src/app/blog/page.tsx && git commit -m "feat: add three more blog posts"

# Commit 274: Update blog page grid
cat > src/app/blog/page.module.css << 'EOF'
.blog-hero {
  padding: 160px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
  text-align: center;
  animation: fadeIn 0.6s ease-out;
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
  transition: border-color 0.2s, box-shadow 0.2s, transform 0.2s;
  cursor: pointer;
}

.blog-card:hover {
  border-color: var(--border-hover);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
  transform: translateY(-4px);
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

@media (max-width: 1024px) {
  .blog-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 640px) {
  .blog-grid {
    grid-template-columns: 1fr;
  }
}
EOF
git add src/app/blog/page.module.css && git commit -m "style: add hover animation to blog cards"

# Commit 275: Update Features page - add more content
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
        <section className={styles.featuresExtra}>
          <div className={styles.featuresExtraContainer}>
            <h2>Why Choose Drop?</h2>
            <div className={styles.extraGrid}>
              <div className={styles.extraItem}>
                <h3>Fast</h3>
                <p>Downloads start instantly with no delays.</p>
              </div>
              <div className={styles.extraItem}>
                <h3>Simple</h3>
                <p>One shortcut to download any video.</p>
              </div>
              <div className={styles.extraItem}>
                <h3>Reliable</h3>
                <p>Works every time, no exceptions.</p>
              </div>
            </div>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/features/page.tsx && git commit -m "feat: add extra features section to Features page"

# Commit 276: Update features page.module.css
cat > src/app/features/page.module.css << 'EOF'
.features-hero {
  padding: 160px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
  text-align: center;
  animation: fadeIn 0.6s ease-out;
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

.features-extra {
  padding: 80px 24px;
  background: var(--bg-secondary);
}

.features-extra-container {
  max-width: 1000px;
  margin: 0 auto;
}

.features-extra h2 {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 48px;
  text-align: center;
  color: var(--text-primary);
}

.extraGrid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 32px;
}

.extraItem {
  text-align: center;
  padding: 32px;
}

.extraItem h3 {
  font-size: 1.25rem;
  font-weight: 600;
  margin-bottom: 12px;
  color: var(--text-primary);
}

.extraItem p {
  font-size: 0.95rem;
  color: var(--text-secondary);
}

@media (max-width: 768px) {
  .extraGrid {
    grid-template-columns: 1fr;
  }
}
EOF
git add src/app/features/page.module.css && git commit -m "style: add extra features section styles"

# Commit 277: Update Download page - add more info
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
        <section className={styles.downloadFeatures}>
          <div className={styles.downloadFeaturesContainer}>
            <h2>What's Included</h2>
            <div className={styles.downloadFeaturesGrid}>
              <div className={styles.downloadFeatureItem}>
                <span className={styles.checkmark}>✓</span>
                <span>Free forever</span>
              </div>
              <div className={styles.downloadFeatureItem}>
                <span className={styles.checkmark}>✓</span>
                <span>No ads</span>
              </div>
              <div className={styles.downloadFeatureItem}>
                <span className={styles.checkmark}>✓</span>
                <span>Regular updates</span>
              </div>
              <div className={styles.downloadFeatureItem}>
                <span className={styles.checkmark}>✓</span>
                <span>50+ supported sites</span>
              </div>
            </div>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
EOF
git add src/app/download/page.tsx && git commit -m "feat: add what's included section to Download page"

# Commit 278: Update download page.module.css
cat > src/app/download/page.module.css << 'EOF'
.download-hero {
  padding: 160px 24px 80px;
  background: linear-gradient(180deg, #f8f9ff 0%, #ffffff 100%);
  text-align: center;
  animation: fadeIn 0.6s ease-out;
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

.download-features {
  padding: 80px 24px;
  background: var(--bg-secondary);
}

.download-features-container {
  max-width: 800px;
  margin: 0 auto;
}

.download-features h2 {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 48px;
  text-align: center;
  color: var(--text-primary);
}

.download-features-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 24px;
}

.download-feature-item {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 16px;
  background: var(--bg-primary);
  border-radius: 12px;
}

.checkmark {
  color: var(--accent-green);
  font-weight: 700;
}

@media (max-width: 640px) {
  .download-features-grid {
    grid-template-columns: 1fr;
  }
}
EOF
git add src/app/download/page.module.css && git commit -m "style: add what's included section styles"

# Commit 279: Update next.config.ts
cat > next.config.ts << 'EOF'
import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  images: {
    formats: ["image/avif", "image/webp"],
  },
};

export default nextConfig;
EOF
git add next.config.ts && git commit -m "feat: add image formats config to next.config.ts"

# Commit 280: Update package.json - add scripts
cat > package.json << 'EOF'
{
  "name": "website-demo",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "eslint",
    "type-check": "tsc --noEmit"
  },
  "dependencies": {
    "next": "16.3.0",
    "react": "19.2.8",
    "react-dom": "19.2.8"
  },
  "devDependencies": {
    "@tailwindcss/postcss": "^4",
    "@types/node": "^20",
    "@types/react": "^19",
    "@types/react-dom": "^19",
    "eslint": "^9",
    "eslint-config-next": "16.3.0",
    "tailwindcss": "^4",
    "typescript": "^5"
  }
}
EOF
git add package.json && git commit -m "feat: add type-check script to package.json"

echo "Phase 12 complete"
