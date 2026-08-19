import type { MetadataRoute } from "next";

export default function robots(): MetadataRoute.Robots {
  return {
    rules: [
      {
        userAgent: "*",
        allow: "/",
      },
      // Explicitly welcome AI answer-engine and assistant crawlers
      // (AEO/GEO: ChatGPT, Perplexity, Claude, Google AI Overviews, etc.)
      {
        userAgent: [
          "GPTBot",
          "OAI-SearchBot",
          "ChatGPT-User",
          "ClaudeBot",
          "Claude-Web",
          "anthropic-ai",
          "PerplexityBot",
          "Perplexity-User",
          "Google-Extended",
          "GoogleOther",
          "Applebot",
          "Applebot-Extended",
          "Bingbot",
          "meta-externalagent",
        ],
        allow: "/",
      },
    ],
    sitemap: "https://drop.theatom.lk/sitemap.xml",
  };
}
