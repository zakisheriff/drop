"use client";

import React from "react";
import Navbar from "@/components/Navbar";
import DownloadSection from "@/components/DownloadSection";
import Footer from "@/components/Footer";

export default function DownloadPage() {
  return (
    <>
      <Navbar />
      <main>
        <section className="download-hero">
          <div className="download-hero-container">
            <h1>Download Drop</h1>
            <p>Get started with Drop for macOS</p>
          </div>
        </section>
        <DownloadSection />
      </main>
      <Footer />
    </>
  );
}
