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
