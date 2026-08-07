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
