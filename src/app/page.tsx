"use client";

import React from "react";
import Hero from "@/components/Hero";
import FeaturesSection from "@/components/FeaturesSection";
import Stats from "@/components/Stats";
import TestimonialsSection from "@/components/TestimonialsSection";
import DownloadSection from "@/components/DownloadSection";
import FAQ from "@/components/FAQ";
import Newsletter from "@/components/Newsletter";
import CTASection from "@/components/CTASection";

export default function HomePage() {
  return (
    <main>
      <Hero />
      <FeaturesSection />
      <Stats />
      <TestimonialsSection />
      <DownloadSection />
      <FAQ />
      <Newsletter />
      <CTASection />
    </main>
  );
}
