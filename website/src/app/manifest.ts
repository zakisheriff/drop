import type { MetadataRoute } from "next";

export default function manifest(): MetadataRoute.Manifest {
  return {
    name: "Drop - Copy. Download. Done.",
    short_name: "Drop",
    description:
      "A native macOS utility that monitors your clipboard for video links and downloads them instantly with Control+D in highest quality.",
    start_url: "/",
    display: "standalone",
    background_color: "#0b1220",
    theme_color: "#1d4ed8",
    icons: [
      { src: "/icon-48.png", sizes: "48x48", type: "image/png" },
      { src: "/icon-96.png", sizes: "96x96", type: "image/png" },
      { src: "/icon-192.png", sizes: "192x192", type: "image/png" },
      { src: "/icon-512.png", sizes: "512x512", type: "image/png" },
    ],
  };
}
