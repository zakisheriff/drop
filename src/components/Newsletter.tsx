"use client";

import React, { useState } from "react";
import styles from "./Newsletter.module.css";

export default function Newsletter() {
  const [email, setEmail] = useState("");

  return (
    <section className={styles.newsletter}>
      <div className={styles.newsletterContainer}>
        <div className={styles.newsletterContent}>
          <h2 className={styles.newsletterTitle}>Stay updated</h2>
          <p className={styles.newsletterSubtitle}>Get the latest news and updates about Drop</p>
          <form className={styles.newsletterForm}>
            <input 
              type="email" 
              placeholder="Enter your email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
            />
            <button type="submit" className="btn-primary">
              Subscribe
            </button>
          </form>
        </div>
      </div>
    </section>
  );
}
