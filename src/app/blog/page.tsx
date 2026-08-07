"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";

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
];

export default function BlogPage() {
  return (
    <>
      <Navbar />
      <main>
      </main>
      <Footer />
    </>
  );
}
