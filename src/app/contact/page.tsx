"use client";

import React, { useState } from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";

export default function ContactPage() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [message, setMessage] = useState("");

  return (
    <>
      <Navbar />
      <main>
        <section className="contact-hero">
          <div className="contact-hero-container">
            <h1>Contact Us</h1>
            <p>Have questions? We'd love to hear from you.</p>
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
}
