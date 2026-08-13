import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import { Analytics } from "@vercel/analytics/next";
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
  title: "Drop - Copy. Download. Done. | Instant Video Downloader for macOS",
  description: "A native macOS utility that monitors your clipboard for video links and downloads them instantly with Control+D in highest quality.",
  metadataBase: new URL("https://drop.theatom.lk"),
  keywords: [
    "Drop",
    "Drop App",
    "macOS utility",
    "video downloader",
    "macOS video downloader",
    "clipboard downloader",
    "yt-dlp mac GUI",
    "instant download macOS",
    "The Atom"
  ],
  category: "utilities",
  robots: {
    index: true,
    follow: true,
  },
  icons: {
    icon: [
      { url: "/icon-48.png", sizes: "48x48", type: "image/png" },
      { url: "/icon-96.png", sizes: "96x96", type: "image/png" },
      { url: "/icon-192.png", sizes: "192x192", type: "image/png" },
      { url: "/icon-512.png", sizes: "512x512", type: "image/png" },
    ],
    shortcut: "/favicon.ico",
    apple: [
      { url: "/apple-touch-icon.png", sizes: "180x180", type: "image/png" },
    ],
  },
  openGraph: {
    title: "Drop - Copy. Download. Done. | Instant Video Downloader for macOS",
    description: "Download videos in highest quality with a single shortcut on macOS.",
    url: "https://drop.theatom.lk",
    siteName: "Drop",
    locale: "en_US",
    type: "website",
    images: [
      {
        url: "/og-image.png",
        width: 1200,
        height: 1200,
        alt: "Drop App Logo",
      },
    ],
  },
  twitter: {
    card: "summary_large_image",
    title: "Drop - Copy. Download. Done.",
    description: "Download videos in highest quality with a single shortcut on macOS.",
    images: ["/og-image.png"],
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
  const jsonLd = {
    "@context": "https://schema.org",
    "@graph": [
      {
        "@type": "SoftwareApplication",
        "@id": "https://drop.theatom.lk/#software",
        "name": "Drop",
        "url": "https://drop.theatom.lk",
        "downloadUrl": "https://drop.theatom.lk/build/Drop-macOS.dmg",
        "operatingSystem": "macOS 15.0 or later",
        "applicationCategory": "UtilityApplication",
        "description": "A native macOS utility that monitors your clipboard for video links and downloads them instantly with Control+D in highest quality.",
        "image": "https://drop.theatom.lk/icon-512.png",
        "logo": "https://drop.theatom.lk/icon-512.png",
        "screenshot": "https://drop.theatom.lk/og-image.png",
        "softwareVersion": "1.0.0",
        "offers": {
          "@type": "Offer",
          "price": "0.00",
          "priceCurrency": "USD"
        },
        "publisher": {
          "@type": "Organization",
          "@id": "https://theatom.lk/#organization",
          "name": "The Atom",
          "url": "https://theatom.lk",
          "logo": "https://drop.theatom.lk/icon-512.png"
        }
      },
      {
        "@type": "WebSite",
        "@id": "https://drop.theatom.lk/#website",
        "url": "https://drop.theatom.lk",
        "name": "Drop",
        "publisher": {
          "@id": "https://theatom.lk/#organization"
        }
      },
      {
        "@type": "FAQPage",
        "@id": "https://drop.theatom.lk/#faq",
        "mainEntity": [
          {
            "@type": "Question",
            "name": "How does Drop work?",
            "acceptedAnswer": {
              "@type": "Answer",
              "text": "Drop monitors your macOS clipboard for video links. When you copy a link and press the Control+D (⌃D) shortcut, it instantly downloads the video in the highest available quality."
            }
          },
          {
            "@type": "Question",
            "name": "What are the system requirements for Drop?",
            "acceptedAnswer": {
              "@type": "Answer",
              "text": "Drop requires macOS 15.0 or later to run."
            }
          },
          {
            "@type": "Question",
            "name": "Is Drop free?",
            "acceptedAnswer": {
              "@type": "Answer",
              "text": "Yes, Drop is completely free to download and use."
            }
          }
        ]
      }
    ]
  };

  return (
    <html
      lang="en"
      className={`${geistSans.variable} ${geistMono.variable} h-full antialiased`}
    >
      <head>
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
        />
      </head>
      <body className="min-h-full flex flex-col">
        {children}
        <Analytics />
      </body>
    </html>
  );
}
