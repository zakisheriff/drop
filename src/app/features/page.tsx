"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import FeaturesSection from "@/components/FeaturesSection";
import Footer from "@/components/Footer";

export default function FeaturesPage() {
  return (
    <>
      <Navbar />
      <main>
        <section className="features-hero">
          <div className="features-hero-container">
            <h1>Features</h1>
            <p>Everything you need to download videos instantly</p>
          </div>
        </section>
        <FeaturesSection />
      </main>
      <Footer />
    </>
  );
}
