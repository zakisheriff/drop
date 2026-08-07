#!/bin/bash
# Phase 1: Base config files
cd /Users/afraasheriff/Desktop/The_Atom/Atom-Originals/drop/website-demo

# Commit 1: package.json
git add package.json && git commit -m "feat: initialize package.json with Next.js 16 dependencies"

# Commit 2: next.config.ts
cat > next.config.ts << 'EOF'
import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */
};

export default nextConfig;
EOF
git add next.config.ts && git commit -m "feat: add next.config.ts with empty configuration"

# Commit 3: tsconfig.json
cat > tsconfig.json << 'EOF'
{
  "compilerOptions": {
    "target": "ES2017",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "react-jsx",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "paths": {
      "@/*": ["./src/*"]
    }
  },
  "include": [
    "next-env.d.ts",
    "**/*.ts",
    "**/*.tsx",
    ".next/types/**/*.ts",
    ".next/dev/types/**/*.ts",
    "**/*.mts"
  ],
  "exclude": ["node_modules"]
}
EOF
git add tsconfig.json && git commit -m "feat: add tsconfig.json with path aliases"

# Commit 4: postcss.config.mjs
cat > postcss.config.mjs << 'EOF'
const config = {
  plugins: {
    "@tailwindcss/postcss": {},
  },
};

export default config;
EOF
git add postcss.config.mjs && git commit -m "feat: add postcss config with tailwindcss plugin"

# Commit 5: .gitignore
cat > .gitignore << 'EOF'
# dependencies
/node_modules
/.pnp
.pnp.js
.yarn/install-state.gz

# testing
/coverage

# next.js
/.next/
/out/

# production
/build

# misc
.DS_Store
*.pem

# debug
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# local env files
.env*.local
.env

# typescript
*.tsbuildinfo
next-env.d.ts
EOF
git add .gitignore && git commit -m "feat: add .gitignore for Next.js project"

# Commit 6: eslint.config.mjs
cat > eslint.config.mjs << 'EOF'
import { defineConfig, globalIgnores } from "eslint/config";
import nextVitals from "eslint-config-next/core-web-vitals";
import nextTs from "eslint-config-next/typescript";

const eslintConfig = defineConfig([
  ...nextVitals,
  ...nextTs,
  globalIgnores([
    ".next/**",
    "out/**",
    "build/**",
    "next-env.d.ts",
  ]),
]);

export default eslintConfig;
EOF
git add eslint.config.mjs && git commit -m "feat: add eslint config with next.js typescript rules"

echo "Phase 1 complete: 6 commits"
