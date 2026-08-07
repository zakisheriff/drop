"use client";

import React, { useState } from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import styles from "./page.module.css";

export default function ContactPage() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [message, setMessage] = useState("");
  const [submitted, setSubmitted] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setSubmitted(true);
  };

  return (
    <>
      <Navbar />
      <main>
        <section className={styles.contactHero}>
          <div className={styles.contactHeroContainer}>
            <h1>Contact Us</h1>
            <p>Have questions? We'd love to hear from you.</p>
          </div>
        </section>
        <section className={styles.contactFormSection}>
          <div className={styles.contactFormContainer}>
            {submitted ? (
              <div className={styles.successMessage}>
                <h2>Thank you!</h2>
                <p>Your message has been sent. We'll get back to you soon.</p>
              </div>
            ) : (
              <form className={styles.contactForm} onSubmit={handleSubmit}>
                <div className={styles.formGroup}>
                  <label htmlFor="name">Name</label>
                  <input 
                    type="text" 
                    id="name"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    required
                  />
                </div>
                <div className={styles.formGroup}>
                  <label htmlFor="email">Email</label>
                  <input 
                    type="email" 
                    id="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    required
                  />
                </div>
                <div className={styles.formGroup}>
                  <label htmlFor="message">Message</label>
                  <textarea 
                    id="message"
                    value={message}
                    onChange={(e) => setMessage(e.target.value)}
                    required
                  />
                </div>
                <button type="submit" className="btn-primary">Send Message</button>
              </form>
            )}
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
