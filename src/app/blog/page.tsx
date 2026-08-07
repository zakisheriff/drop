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
