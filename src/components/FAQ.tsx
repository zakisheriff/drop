"use client";

import React, { useState } from "react";

const faqs = [
  {
    question: "What is Drop?",
    answer: "Drop is a native macOS utility that monitors your clipboard for video links and downloads them instantly with a keyboard shortcut.",
  },
  {
    question: "How do I use Drop?",
    answer: "Simply copy a video link to your clipboard and press Control+D. Drop will automatically detect the link and start downloading the video.",
  },
  {
    question: "What video formats are supported?",
    answer: "Drop supports all major video formats including MP4, WebM, AVI, and more. It downloads videos in the highest available quality.",
  },
  {
    question: "Is Drop free to use?",
    answer: "Yes, Drop is completely free to use. There are no hidden fees or premium features.",
  },
];

export default function FAQ() {
  const [openIndex, setOpenIndex] = useState<number | null>(null);

  return (
    <section className="faq">
    </section>
  );
}
