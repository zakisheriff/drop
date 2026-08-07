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
