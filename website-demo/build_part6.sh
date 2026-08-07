#!/bin/bash
cd /Users/afraasheriff/Desktop/The_Atom/Atom-Originals/drop/website-demo

# ============================================
# PHASE 6: Features Section (commits 87-130)
# ============================================

# Commit 87: Create FeatureCard.tsx
cat > src/components/FeatureCard.tsx << 'EOF'
"use client";

import React from "react";
EOF
git add src/components/FeatureCard.tsx && git commit -m "feat: create FeatureCard component file"

# Commit 88: Add FeatureCard interface
cat > src/components/FeatureCard.tsx << 'EOF'
"use client";

import React from "react";

interface FeatureCardProps {
  icon: string;
  title: string;
  description: string;
}
EOF
git add src/components/FeatureCard.tsx && git commit -m "feat: add FeatureCardProps interface"

# Commit 89: Add FeatureCard function
cat > src/components/FeatureCard.tsx << 'EOF'
"use client";

import React from "react";

interface FeatureCardProps {
  icon: string;
  title: string;
  description: string;
}

export default function FeatureCard({ icon, title, description }: FeatureCardProps) {
  return (
    <div className="feature-card">
    </div>
  );
}
EOF
git add src/components/FeatureCard.tsx && git commit -m "feat: add FeatureCard function component"

# Commit 90: Add feature icon
cat > src/components/FeatureCard.tsx << 'EOF'
"use client";

import React from "react";

interface FeatureCardProps {
  icon: string;
  title: string;
  description: string;
}

export default function FeatureCard({ icon, title, description }: FeatureCardProps) {
  return (
    <div className="feature-card">
      <div className="feature-icon">
        <span>{icon}</span>
      </div>
    </div>
  );
}
EOF
git add src/components/FeatureCard.tsx && git commit -m "feat: add feature icon display"

# Commit 91: Add feature title
cat > src/components/FeatureCard.tsx << 'EOF'
"use client";

import React from "react";

interface FeatureCardProps {
  icon: string;
  title: string;
  description: string;
}

export default function FeatureCard({ icon, title, description }: FeatureCardProps) {
  return (
    <div className="feature-card">
      <div className="feature-icon">
        <span>{icon}</span>
      </div>
      <h3 className="feature-title">{title}</h3>
    </div>
  );
}
EOF
git add src/components/FeatureCard.tsx && git commit -m "feat: add feature title heading"

# Commit 92: Add feature description
cat > src/components/FeatureCard.tsx << 'EOF'
"use client";

import React from "react";

interface FeatureCardProps {
  icon: string;
  title: string;
  description: string;
}

export default function FeatureCard({ icon, title, description }: FeatureCardProps) {
  return (
    <div className="feature-card">
      <div className="feature-icon">
        <span>{icon}</span>
      </div>
      <h3 className="feature-title">{title}</h3>
      <p className="feature-description">{description}</p>
    </div>
  );
}
EOF
git add src/components/FeatureCard.tsx && git commit -m "feat: add feature description paragraph"

# Commit 93: Create FeatureCard.module.css
cat > src/components/FeatureCard.module.css << 'EOF'
.feature-card {
  padding: 32px;
  background: var(--bg-primary);
  border-radius: 16px;
  border: 1px solid var(--border-color);
  transition: border-color 0.2s, box-shadow 0.2s;
}
EOF
git add src/components/FeatureCard.module.css && git commit -m "style: create FeatureCard.module.css with card styles"

# Commit 94: Add feature card hover
cat > src/components/FeatureCard.module.css << 'EOF'
.feature-card {
  padding: 32px;
  background: var(--bg-primary);
  border-radius: 16px;
  border: 1px solid var(--border-color);
  transition: border-color 0.2s, box-shadow 0.2s;
}

.feature-card:hover {
  border-color: var(--border-hover);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}
EOF
git add src/components/FeatureCard.module.css && git commit -m "style: add feature card hover effects"

# Commit 95: Add feature icon styles
cat > src/components/FeatureCard.module.css << 'EOF'
.feature-card {
  padding: 32px;
  background: var(--bg-primary);
  border-radius: 16px;
  border: 1px solid var(--border-color);
  transition: border-color 0.2s, box-shadow 0.2s;
}

.feature-card:hover {
  border-color: var(--border-hover);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
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
}
EOF
git add src/components/FeatureCard.module.css && git commit -m "style: add feature icon container styles"

# Commit 96: Add feature title styles
cat > src/components/FeatureCard.module.css << 'EOF'
.feature-card {
  padding: 32px;
  background: var(--bg-primary);
  border-radius: 16px;
  border: 1px solid var(--border-color);
  transition: border-color 0.2s, box-shadow 0.2s;
}

.feature-card:hover {
  border-color: var(--border-hover);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
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
}

.feature-title {
  font-size: 1.25rem;
  font-weight: 600;
  margin-bottom: 12px;
  color: var(--text-primary);
}
EOF
git add src/components/FeatureCard.module.css && git commit -m "style: add feature title font styles"

# Commit 97: Add feature description styles
cat > src/components/FeatureCard.module.css << 'EOF'
.feature-card {
  padding: 32px;
  background: var(--bg-primary);
  border-radius: 16px;
  border: 1px solid var(--border-color);
  transition: border-color 0.2s, box-shadow 0.2s;
}

.feature-card:hover {
  border-color: var(--border-hover);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
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
git add src/components/FeatureCard.module.css && git commit -m "style: add feature description text styles"

# Commit 98: Import styles in FeatureCard
cat > src/components/FeatureCard.tsx << 'EOF'
"use client";

import React from "react";
import styles from "./FeatureCard.module.css";

interface FeatureCardProps {
  icon: string;
  title: string;
  description: string;
}

export default function FeatureCard({ icon, title, description }: FeatureCardProps) {
  return (
    <div className={styles.featureCard}>
      <div className={styles.featureIcon}>
        <span>{icon}</span>
      </div>
      <h3 className={styles.featureTitle}>{title}</h3>
      <p className={styles.featureDescription}>{description}</p>
    </div>
  );
}
EOF
git add src/components/FeatureCard.tsx && git commit -m "refactor: import and use CSS module styles in FeatureCard"

# Commit 99: Create FeaturesSection.tsx
cat > src/components/FeaturesSection.tsx << 'EOF'
"use client";

import React from "react";
EOF
git add src/components/FeaturesSection.tsx && git commit -m "feat: create FeaturesSection component file"

# Commit 100: Add features data array
cat > src/components/FeaturesSection.tsx << 'EOF'
"use client";

import React from "react";

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
    icon: " quality",
    title: "Highest Quality",
    description: "Downloads videos in the highest available quality, up to 4K resolution.",
  },
];
EOF
git add src/components/FeaturesSection.tsx && git commit -m "feat: add features data array with icons"

# Commit 101: Add FeaturesSection function
cat > src/components/FeaturesSection.tsx << 'EOF'
"use client";

import React from "react";

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
];

export default function FeaturesSection() {
  return (
    <section className="features">
    </section>
  );
}
EOF
git add src/components/FeaturesSection.tsx && git commit -m "feat: add FeaturesSection function component"

# Commit 102: Add features container
cat > src/components/FeaturesSection.tsx << 'EOF'
"use client";

import React from "react";

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
];

export default function FeaturesSection() {
  return (
    <section className="features">
      <div className="features-container">
      </div>
    </section>
  );
}
EOF
git add src/components/FeaturesSection.tsx && git commit -m "style: add features container div"

# Commit 103: Add features header
cat > src/components/FeaturesSection.tsx << 'EOF'
"use client";

import React from "react";

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
];

export default function FeaturesSection() {
  return (
    <section className="features">
      <div className="features-container">
        <div className="features-header">
          <h2 className="features-title">Features</h2>
          <p className="features-subtitle">Everything you need to download videos instantly</p>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/FeaturesSection.tsx && git commit -m "feat: add features section header with title"

# Commit 104: Add features grid
cat > src/components/FeaturesSection.tsx << 'EOF'
"use client";

import React from "react";
import FeatureCard from "./FeatureCard";

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
];

export default function FeaturesSection() {
  return (
    <section className="features">
      <div className="features-container">
        <div className="features-header">
          <h2 className="features-title">Features</h2>
          <p className="features-subtitle">Everything you need to download videos instantly</p>
        </div>
        <div className="features-grid">
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
git add src/components/FeaturesSection.tsx && git commit -m "feat: add features grid with FeatureCard mapping"

# Commit 105: Create FeaturesSection.module.css
cat > src/components/FeaturesSection.module.css << 'EOF'
.features {
  padding: 120px 24px;
  background: var(--bg-secondary);
}
EOF
git add src/components/FeaturesSection.module.css && git commit -m "style: create FeaturesSection.module.css"

# Commit 106: Add features container styles
cat > src/components/FeaturesSection.module.css << 'EOF'
.features {
  padding: 120px 24px;
  background: var(--bg-secondary);
}

.features-container {
  max-width: 1200px;
  margin: 0 auto;
}
EOF
git add src/components/FeaturesSection.module.css && git commit -m "style: add features container max-width"

# Commit 107: Add features header styles
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
EOF
git add src/components/FeaturesSection.module.css && git commit -m "style: add features header and title styles"

# Commit 108: Add features grid styles
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

@media (max-width: 768px) {
  .features-grid {
    grid-template-columns: 1fr;
  }
}
EOF
git add src/components/FeaturesSection.module.css && git commit -m "style: add features grid responsive layout"

# Commit 109: Import styles in FeaturesSection
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
git add src/components/FeaturesSection.tsx && git commit -m "refactor: import and use CSS module styles in FeaturesSection"

echo "Phase 6 FeaturesSection complete"
