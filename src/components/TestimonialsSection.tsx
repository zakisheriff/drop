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
