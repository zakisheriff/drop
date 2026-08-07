#!/bin/bash
cd /Users/afraasheriff/Desktop/The_Atom/Atom-Originals/drop/website-demo

# ============================================
# PHASE 3: Layout.tsx (commits 30-50)
# ============================================

# Commit 30: Layout initial import
cat > src/app/layout.tsx << 'EOF'
import type { Metadata } from "next";
EOF
git add src/app/layout.tsx && git commit -m "feat: add layout.tsx metadata type import"

# Commit 31: Add font imports
cat > src/app/layout.tsx << 'EOF'
import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
EOF
git add src/app/layout.tsx && git commit -m "feat: add geist font imports from next/font"

# Commit 32: Add globals.css import
cat > src/app/layout.tsx << 'EOF'
import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";
EOF
git add src/app/layout.tsx && git commit -m "feat: import globals.css in layout"

# Commit 33: Add geistSans font config
cat > src/app/layout.tsx << 'EOF'
import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});
EOF
git add src/app/layout.tsx && git commit -m "feat: configure geist sans font with variable"

# Commit 34: Add geistMono font config
cat > src/app/layout.tsx << 'EOF'
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
EOF
git add src/app/layout.tsx && git commit -m "feat: configure geist mono font with variable"

# Commit 35: Add metadata title
cat > src/app/layout.tsx << 'EOF'
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
  title: "Drop Demo - Copy. Download. Done.",
};
EOF
git add src/app/layout.tsx && git commit -m "feat: add metadata title for drop demo"

# Commit 36: Add metadata description
cat > src/app/layout.tsx << 'EOF'
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
  title: "Drop Demo - Copy. Download. Done.",
  description: "A demo website showcasing the Drop macOS utility for instant video downloads.",
};
EOF
git add src/app/layout.tsx && git commit -m "feat: add metadata description for drop demo"

# Commit 37: Add metadataBase
cat > src/app/layout.tsx << 'EOF'
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
  title: "Drop Demo - Copy. Download. Done.",
  description: "A demo website showcasing the Drop macOS utility for instant video downloads.",
  metadataBase: new URL("https://demo.drop.theatom.lk"),
};
EOF
git add src/app/layout.tsx && git commit -m "feat: add metadataBase URL for demo site"

# Commit 38: Add openGraph title
cat > src/app/layout.tsx << 'EOF'
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
  title: "Drop Demo - Copy. Download. Done.",
  description: "A demo website showcasing the Drop macOS utility for instant video downloads.",
  metadataBase: new URL("https://demo.drop.theatom.lk"),
  openGraph: {
    title: "Drop Demo - Copy. Download. Done.",
  },
};
EOF
git add src/app/layout.tsx && git commit -m "feat: add openGraph title metadata"

# Commit 39: Add openGraph description
cat > src/app/layout.tsx << 'EOF'
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
  title: "Drop Demo - Copy. Download. Done.",
  description: "A demo website showcasing the Drop macOS utility for instant video downloads.",
  metadataBase: new URL("https://demo.drop.theatom.lk"),
  openGraph: {
    title: "Drop Demo - Copy. Download. Done.",
    description: "Download videos in highest quality with a single shortcut on macOS.",
  },
};
EOF
git add src/app/layout.tsx && git commit -m "feat: add openGraph description metadata"

# Commit 40: Add RootLayout function
cat > src/app/layout.tsx << 'EOF'
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
  title: "Drop Demo - Copy. Download. Done.",
  description: "A demo website showcasing the Drop macOS utility for instant video downloads.",
  metadataBase: new URL("https://demo.drop.theatom.lk"),
  openGraph: {
    title: "Drop Demo - Copy. Download. Done.",
    description: "Download videos in highest quality with a single shortcut on macOS.",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html>
      <body>{children}</body>
    </html>
  );
}
EOF
git add src/app/layout.tsx && git commit -m "feat: add RootLayout component with html and body"

# Commit 41: Add lang attribute
cat > src/app/layout.tsx << 'EOF'
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
  title: "Drop Demo - Copy. Download. Done.",
  description: "A demo website showcasing the Drop macOS utility for instant video downloads.",
  metadataBase: new URL("https://demo.drop.theatom.lk"),
  openGraph: {
    title: "Drop Demo - Copy. Download. Done.",
    description: "Download videos in highest quality with a single shortcut on macOS.",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
EOF
git add src/app/layout.tsx && git commit -m "feat: add lang attribute to html element"

# Commit 42: Add font variables to html
cat > src/app/layout.tsx << 'EOF'
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
  title: "Drop Demo - Copy. Download. Done.",
  description: "A demo website showcasing the Drop macOS utility for instant video downloads.",
  metadataBase: new URL("https://demo.drop.theatom.lk"),
  openGraph: {
    title: "Drop Demo - Copy. Download. Done.",
    description: "Download videos in highest quality with a single shortcut on macOS.",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className={`${geistSans.variable} ${geistMono.variable}`}>
      <body>{children}</body>
    </html>
  );
}
EOF
git add src/app/layout.tsx && git commit -m "feat: add font CSS variables to html element"

# Commit 43: Add antialiased class
cat > src/app/layout.tsx << 'EOF'
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
  title: "Drop Demo - Copy. Download. Done.",
  description: "A demo website showcasing the Drop macOS utility for instant video downloads.",
  metadataBase: new URL("https://demo.drop.theatom.lk"),
  openGraph: {
    title: "Drop Demo - Copy. Download. Done.",
    description: "Download videos in highest quality with a single shortcut on macOS.",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className={`${geistSans.variable} ${geistMono.variable} antialiased`}>
      <body>{children}</body>
    </html>
  );
}
EOF
git add src/app/layout.tsx && git commit -m "style: add antialiased class to html"

# Commit 44: Add h-full to html
cat > src/app/layout.tsx << 'EOF'
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
  title: "Drop Demo - Copy. Download. Done.",
  description: "A demo website showcasing the Drop macOS utility for instant video downloads.",
  metadataBase: new URL("https://demo.drop.theatom.lk"),
  openGraph: {
    title: "Drop Demo - Copy. Download. Done.",
    description: "Download videos in highest quality with a single shortcut on macOS.",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className={`${geistSans.variable} ${geistMono.variable} h-full antialiased`}>
      <body>{children}</body>
    </html>
  );
}
EOF
git add src/app/layout.tsx && git commit -m "style: add h-full class to html element"

# Commit 45: Add min-h-full to body
cat > src/app/layout.tsx << 'EOF'
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
  title: "Drop Demo - Copy. Download. Done.",
  description: "A demo website showcasing the Drop macOS utility for instant video downloads.",
  metadataBase: new URL("https://demo.drop.theatom.lk"),
  openGraph: {
    title: "Drop Demo - Copy. Download. Done.",
    description: "Download videos in highest quality with a single shortcut on macOS.",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className={`${geistSans.variable} ${geistMono.variable} h-full antialiased`}>
      <body className="min-h-full flex flex-col">{children}</body>
    </html>
  );
}
EOF
git add src/app/layout.tsx && git commit -m "style: add min-h-full and flex-col to body"

echo "Phase 3 layout.tsx complete"
