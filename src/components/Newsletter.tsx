"use client";

import React, { useState } from "react";

export default function Newsletter() {
  const [email, setEmail] = useState("");

  return (
    <section className="newsletter">
      <div className="newsletter-container">
        <div className="newsletter-content">
          <h2 className="newsletter-title">Stay updated</h2>
          <p className="newsletter-subtitle">Get the latest news and updates about Drop</p>
        </div>
      </div>
    </section>
  );
}
