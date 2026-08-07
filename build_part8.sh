#!/bin/bash
cd /Users/afraasheriff/Desktop/The_Atom/Atom-Originals/drop/website-demo

# ============================================
# PHASE 8: More Components (commits 141-200)
# ============================================

# Commit 141: Create TestimonialCard.tsx
cat > src/components/TestimonialCard.tsx << 'EOF'
"use client";

import React from "react";
EOF
git add src/components/TestimonialCard.tsx && git commit -m "feat: create TestimonialCard component file"

# Commit 142: Add TestimonialCard interface
cat > src/components/TestimonialCard.tsx << 'EOF'
"use client";

import React from "react";

interface TestimonialCardProps {
  name: string;
  role: string;
  content: string;
  avatar: string;
}
EOF
git add src/components/TestimonialCard.tsx && git commit -m "feat: add TestimonialCardProps interface"

# Commit 143: Add TestimonialCard function
cat > src/components/TestimonialCard.tsx << 'EOF'
"use client";

import React from "react";

interface TestimonialCardProps {
  name: string;
  role: string;
  content: string;
  avatar: string;
}

export default function TestimonialCard({ name, role, content, avatar }: TestimonialCardProps) {
  return (
    <div className="testimonial-card">
    </div>
  );
}
EOF
git add src/components/TestimonialCard.tsx && git commit -m "feat: add TestimonialCard function component"

# Commit 144: Add testimonial avatar
cat > src/components/TestimonialCard.tsx << 'EOF'
"use client";

import React from "react";

interface TestimonialCardProps {
  name: string;
  role: string;
  content: string;
  avatar: string;
}

export default function TestimonialCard({ name, role, content, avatar }: TestimonialCardProps) {
  return (
    <div className="testimonial-card">
      <div className="testimonial-avatar">
        <span>{avatar}</span>
      </div>
    </div>
  );
}
EOF
git add src/components/TestimonialCard.tsx && git commit -m "feat: add testimonial avatar display"

# Commit 145: Add testimonial content
cat > src/components/TestimonialCard.tsx << 'EOF'
"use client";

import React from "react";

interface TestimonialCardProps {
  name: string;
  role: string;
  content: string;
  avatar: string;
}

export default function TestimonialCard({ name, role, content, avatar }: TestimonialCardProps) {
  return (
    <div className="testimonial-card">
      <div className="testimonial-avatar">
        <span>{avatar}</span>
      </div>
      <p className="testimonial-content">{content}</p>
    </div>
  );
}
EOF
git add src/components/TestimonialCard.tsx && git commit -m "feat: add testimonial content paragraph"

# Commit 146: Add testimonial author
cat > src/components/TestimonialCard.tsx << 'EOF'
"use client";

import React from "react";

interface TestimonialCardProps {
  name: string;
  role: string;
  content: string;
  avatar: string;
}

export default function TestimonialCard({ name, role, content, avatar }: TestimonialCardProps) {
  return (
    <div className="testimonial-card">
      <div className="testimonial-avatar">
        <span>{avatar}</span>
      </div>
      <p className="testimonial-content">{content}</p>
      <div className="testimonial-author">
        <span className="testimonial-name">{name}</span>
        <span className="testimonial-role">{role}</span>
      </div>
    </div>
  );
}
EOF
git add src/components/TestimonialCard.tsx && git commit -m "feat: add testimonial author info"

# Commit 147: Create TestimonialCard.module.css
cat > src/components/TestimonialCard.module.css << 'EOF'
.testimonial-card {
  padding: 32px;
  background: var(--bg-primary);
  border-radius: 16px;
  border: 1px solid var(--border-color);
}
EOF
git add src/components/TestimonialCard.module.css && git commit -m "style: create TestimonialCard.module.css"

# Commit 148: Add testimonial avatar styles
cat > src/components/TestimonialCard.module.css << 'EOF'
.testimonial-card {
  padding: 32px;
  background: var(--bg-primary);
  border-radius: 16px;
  border: 1px solid var(--border-color);
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
EOF
git add src/components/TestimonialCard.module.css && git commit -m "style: add testimonial avatar circle styles"

# Commit 149: Add testimonial content styles
cat > src/components/TestimonialCard.module.css << 'EOF'
.testimonial-card {
  padding: 32px;
  background: var(--bg-primary);
  border-radius: 16px;
  border: 1px solid var(--border-color);
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
}
EOF
git add src/components/TestimonialCard.module.css && git commit -m "style: add testimonial content text styles"

# Commit 150: Add testimonial author styles
cat > src/components/TestimonialCard.module.css << 'EOF'
.testimonial-card {
  padding: 32px;
  background: var(--bg-primary);
  border-radius: 16px;
  border: 1px solid var(--border-color);
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
git add src/components/TestimonialCard.module.css && git commit -m "style: add testimonial author and role styles"

# Commit 151: Import styles in TestimonialCard
cat > src/components/TestimonialCard.tsx << 'EOF'
"use client";

import React from "react";
import styles from "./TestimonialCard.module.css";

interface TestimonialCardProps {
  name: string;
  role: string;
  content: string;
  avatar: string;
}

export default function TestimonialCard({ name, role, content, avatar }: TestimonialCardProps) {
  return (
    <div className={styles.testimonialCard}>
      <div className={styles.testimonialAvatar}>
        <span>{avatar}</span>
      </div>
      <p className={styles.testimonialContent}>{content}</p>
      <div className={styles.testimonialAuthor}>
        <span className={styles.testimonialName}>{name}</span>
        <span className={styles.testimonialRole}>{role}</span>
      </div>
    </div>
  );
}
EOF
git add src/components/TestimonialCard.tsx && git commit -m "refactor: import and use CSS module styles in TestimonialCard"

# Commit 152: Create TestimonialsSection.tsx
cat > src/components/TestimonialsSection.tsx << 'EOF'
"use client";

import React from "react";
EOF
git add src/components/TestimonialsSection.tsx && git commit -m "feat: create TestimonialsSection component file"

# Commit 153: Add testimonials data
cat > src/components/TestimonialsSection.tsx << 'EOF'
"use client";

import React from "react";

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
];
EOF
git add src/components/TestimonialsSection.tsx && git commit -m "feat: add testimonials data array"

# Commit 154: Add TestimonialsSection function
cat > src/components/TestimonialsSection.tsx << 'EOF'
"use client";

import React from "react";
import TestimonialCard from "./TestimonialCard";

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
];

export default function TestimonialsSection() {
  return (
    <section className="testimonials">
    </section>
  );
}
EOF
git add src/components/TestimonialsSection.tsx && git commit -m "feat: add TestimonialsSection function component"

# Commit 155: Add testimonials container
cat > src/components/TestimonialsSection.tsx << 'EOF'
"use client";

import React from "react";
import TestimonialCard from "./TestimonialCard";

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
];

export default function TestimonialsSection() {
  return (
    <section className="testimonials">
      <div className="testimonials-container">
      </div>
    </section>
  );
}
EOF
git add src/components/TestimonialsSection.tsx && git commit -m "style: add testimonials container div"

# Commit 156: Add testimonials header
cat > src/components/TestimonialsSection.tsx << 'EOF'
"use client";

import React from "react";
import TestimonialCard from "./TestimonialCard";

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
];

export default function TestimonialsSection() {
  return (
    <section className="testimonials">
      <div className="testimonials-container">
        <div className="testimonials-header">
          <h2 className="testimonials-title">What users say</h2>
          <p className="testimonials-subtitle">Trusted by thousands of users worldwide</p>
        </div>
      </div>
    </section>
  );
}
EOF
git add src/components/TestimonialsSection.tsx && git commit -m "feat: add testimonials section header"

# Commit 157: Add testimonials grid
cat > src/components/TestimonialsSection.tsx << 'EOF'
"use client";

import React from "react";
import TestimonialCard from "./TestimonialCard";

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
];

export default function TestimonialsSection() {
  return (
    <section className="testimonials">
      <div className="testimonials-container">
        <div className="testimonials-header">
          <h2 className="testimonials-title">What users say</h2>
          <p className="testimonials-subtitle">Trusted by thousands of users worldwide</p>
        </div>
        <div className="testimonials-grid">
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
git add src/components/TestimonialsSection.tsx && git commit -m "feat: add testimonials grid with mapping"

# Commit 158: Create TestimonialsSection.module.css
cat > src/components/TestimonialsSection.module.css << 'EOF'
.testimonials {
  padding: 120px 24px;
  background: var(--bg-primary);
}
EOF
git add src/components/TestimonialsSection.module.css && git commit -m "style: create TestimonialsSection.module.css"

# Commit 159: Add testimonials container styles
cat > src/components/TestimonialsSection.module.css << 'EOF'
.testimonials {
  padding: 120px 24px;
  background: var(--bg-primary);
}

.testimonials-container {
  max-width: 1200px;
  margin: 0 auto;
}
EOF
git add src/components/TestimonialsSection.module.css && git commit -m "style: add testimonials container max-width"

# Commit 160: Add testimonials header styles
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
EOF
git add src/components/TestimonialsSection.module.css && git commit -m "style: add testimonials header and title styles"

# Commit 161: Add testimonials grid styles
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

@media (max-width: 768px) {
  .testimonials-grid {
    grid-template-columns: 1fr;
  }
}
EOF
git add src/components/TestimonialsSection.module.css && git commit -m "style: add testimonials grid responsive layout"

# Commit 162: Import styles in TestimonialsSection
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
git add src/components/TestimonialsSection.tsx && git commit -m "refactor: import and use CSS module styles in TestimonialsSection"

echo "Phase 8 complete"
