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
