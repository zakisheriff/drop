import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Drop - Copy. Download. Done.",
  description: "A native macOS utility that monitors your clipboard for video links and downloads them instantly with Control+D in highest quality.",
  metadataBase: new URL("http://localhost:3001"), // Standard fallback for dev
  icons: {
    icon: "/logo-drop.png",
    shortcut: "/logo-drop.png",
    apple: "/logo-drop.png",
  },
  openGraph: {
    title: "Drop - Copy. Download. Done.",
    description: "Download videos in highest quality with a single shortcut on macOS.",
    images: [
      {
        url: "/logo-drop.png",
        width: 512,
        height: 512,
        alt: "Drop App Logo",
      },
    ],
  },
  other: {
    "geo.region": "LK-11",
    "geo.position": "6.9271;79.8612",
    "ICBM": "6.9271, 79.8612",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html
      lang="en"
      className={`${geistSans.variable} ${geistMono.variable} h-full antialiased`}
    >
      <body className="min-h-full flex flex-col">{children}</body>
    </html>
  );
}
