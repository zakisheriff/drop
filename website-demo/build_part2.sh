#!/bin/bash
cd /Users/afraasheriff/Desktop/The_Atom/Atom-Originals/drop/website-demo

# ============================================
# PHASE 2: Layout and Global Styles (commits 7-80)
# ============================================

# Commit 7: Create src directory structure
mkdir -p src/app src/components src/lib public
touch src/app/layout.tsx
git add src/ && git commit -m "feat: create src directory structure with app router"

# Commit 8: Add globals.css initial
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
}
EOF
git add src/app/globals.css && git commit -m "feat: add globals.css with root variables"

# Commit 9: Add bg-secondary variable
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
}
EOF
git add src/app/globals.css && git commit -m "style: add bg-secondary css variable"

# Commit 10: Add bg-tertiary variable
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
}
EOF
git add src/app/globals.css && git commit -m "style: add bg-tertiary css variable"

# Commit 11: Add border-color variable
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
}
EOF
git add src/app/globals.css && git commit -m "style: add border-color css variable"

# Commit 12: Add border-hover variable
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
}
EOF
git add src/app/globals.css && git commit -m "style: add border-hover css variable"

# Commit 13: Add text-primary variable
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
}
EOF
git add src/app/globals.css && git commit -m "style: add text-primary css variable"

# Commit 14: Add text-secondary variable
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
  --text-secondary: #606060;
}
EOF
git add src/app/globals.css && git commit -m "style: add text-secondary css variable"

# Commit 15: Add accent-color variable
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
  --text-secondary: #606060;
  --accent-color: #0f0f0f;
  --accent-blue: #0066ff;
  --accent-green: #00c853;
  --accent-purple: #7c3aed;
}
EOF
git add src/app/globals.css && git commit -m "style: add accent color variables"

# Commit 16: Add font-family variable
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
  --text-secondary: #606060;
  --accent-color: #0f0f0f;
  --accent-blue: #0066ff;
  --accent-green: #00c853;
  --accent-purple: #7c3aed;
  --font-family: var(--font-geist-sans), -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}
EOF
git add src/app/globals.css && git commit -m "style: add font-family css variable"

# Commit 17: Add box-sizing reset
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
  --text-secondary: #606060;
  --accent-color: #0f0f0f;
  --accent-blue: #0066ff;
  --accent-green: #00c853;
  --accent-purple: #7c3aed;
  --font-family: var(--font-geist-sans), -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}

* {
  box-sizing: border-box;
}
EOF
git add src/app/globals.css && git commit -m "style: add box-sizing border-box reset"

# Commit 18: Add margin reset
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
  --text-secondary: #606060;
  --accent-color: #0f0f0f;
  --accent-blue: #0066ff;
  --accent-green: #00c853;
  --accent-purple: #7c3aed;
  --font-family: var(--font-geist-sans), -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
EOF
git add src/app/globals.css && git commit -m "style: add margin and padding reset"

# Commit 19: Add html body styles
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
  --text-secondary: #606060;
  --accent-color: #0f0f0f;
  --accent-blue: #0066ff;
  --accent-green: #00c853;
  --accent-purple: #7c3aed;
  --font-family: var(--font-geist-sans), -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
  background-color: var(--bg-primary);
  color: var(--text-primary);
  font-family: var(--font-family);
}
EOF
git add src/app/globals.css && git commit -m "style: add html and body base styles"

# Commit 20: Add body height and width
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
  --text-secondary: #606060;
  --accent-color: #0f0f0f;
  --accent-blue: #0066ff;
  --accent-green: #00c853;
  --accent-purple: #7c3aed;
  --font-family: var(--font-geist-sans), -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
  background-color: var(--bg-primary);
  color: var(--text-primary);
  font-family: var(--font-family);
  height: 100vh;
  width: 100vw;
  overflow: hidden;
}
EOF
git add src/app/globals.css && git commit -m "style: add viewport dimensions to body"

# Commit 21: Add font smoothing
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
  --text-secondary: #606060;
  --accent-color: #0f0f0f;
  --accent-blue: #0066ff;
  --accent-green: #00c853;
  --accent-purple: #7c3aed;
  --font-family: var(--font-geist-sans), -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
  background-color: var(--bg-primary);
  color: var(--text-primary);
  font-family: var(--font-family);
  height: 100vh;
  width: 100vw;
  overflow: hidden;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
EOF
git add src/app/globals.css && git commit -m "style: add font smoothing antialiasing"

# Commit 22: Add btn-primary base
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
  --text-secondary: #606060;
  --accent-color: #0f0f0f;
  --accent-blue: #0066ff;
  --accent-green: #00c853;
  --accent-purple: #7c3aed;
  --font-family: var(--font-geist-sans), -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
  background-color: var(--bg-primary);
  color: var(--text-primary);
  font-family: var(--font-family);
  height: 100vh;
  width: 100vw;
  overflow: hidden;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.btn-primary {
  background: var(--text-primary);
  color: var(--bg-primary);
  border: none;
}
EOF
git add src/app/globals.css && git commit -m "style: add btn-primary base styles"

# Commit 23: Add btn-primary padding
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
  --text-secondary: #606060;
  --accent-color: #0f0f0f;
  --accent-blue: #0066ff;
  --accent-green: #00c853;
  --accent-purple: #7c3aed;
  --font-family: var(--font-geist-sans), -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
  background-color: var(--bg-primary);
  color: var(--text-primary);
  font-family: var(--font-family);
  height: 100vh;
  width: 100vw;
  overflow: hidden;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.btn-primary {
  background: var(--text-primary);
  color: var(--bg-primary);
  border: none;
  padding: 12px 24px;
  border-radius: 24px;
}
EOF
git add src/app/globals.css && git commit -m "style: add btn-primary padding and border-radius"

# Commit 24: Add btn-primary font styles
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
  --text-secondary: #606060;
  --accent-color: #0f0f0f;
  --accent-blue: #0066ff;
  --accent-green: #00c853;
  --accent-purple: #7c3aed;
  --font-family: var(--font-geist-sans), -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
  background-color: var(--bg-primary);
  color: var(--text-primary);
  font-family: var(--font-family);
  height: 100vh;
  width: 100vw;
  overflow: hidden;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.btn-primary {
  background: var(--text-primary);
  color: var(--bg-primary);
  border: none;
  padding: 12px 24px;
  border-radius: 24px;
  font-weight: 600;
  font-size: 0.95rem;
}
EOF
git add src/app/globals.css && git commit -m "style: add btn-primary font weight and size"

# Commit 25: Add btn-primary cursor and display
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
  --text-secondary: #606060;
  --accent-color: #0f0f0f;
  --accent-blue: #0066ff;
  --accent-green: #00c853;
  --accent-purple: #7c3aed;
  --font-family: var(--font-geist-sans), -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
  background-color: var(--bg-primary);
  color: var(--text-primary);
  font-family: var(--font-family);
  height: 100vh;
  width: 100vw;
  overflow: hidden;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.btn-primary {
  background: var(--text-primary);
  color: var(--bg-primary);
  border: none;
  padding: 12px 24px;
  border-radius: 24px;
  font-weight: 600;
  font-size: 0.95rem;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 8px;
}
EOF
git add src/app/globals.css && git commit -m "style: add btn-primary cursor and flex alignment"

# Commit 26: Add btn-primary transition
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
  --text-secondary: #606060;
  --accent-color: #0f0f0f;
  --accent-blue: #0066ff;
  --accent-green: #00c853;
  --accent-purple: #7c3aed;
  --font-family: var(--font-geist-sans), -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
  background-color: var(--bg-primary);
  color: var(--text-primary);
  font-family: var(--font-family);
  height: 100vh;
  width: 100vw;
  overflow: hidden;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.btn-primary {
  background: var(--text-primary);
  color: var(--bg-primary);
  border: none;
  padding: 12px 24px;
  border-radius: 24px;
  font-weight: 600;
  font-size: 0.95rem;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 8px;
  transition: background-color 0.2s, transform 0.1s;
}
EOF
git add src/app/globals.css && git commit -m "style: add btn-primary transition effects"

# Commit 27: Add btn-primary hover
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
  --text-secondary: #606060;
  --accent-color: #0f0f0f;
  --accent-blue: #0066ff;
  --accent-green: #00c853;
  --accent-purple: #7c3aed;
  --font-family: var(--font-geist-sans), -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
  background-color: var(--bg-primary);
  color: var(--text-primary);
  font-family: var(--font-family);
  height: 100vh;
  width: 100vw;
  overflow: hidden;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.btn-primary {
  background: var(--text-primary);
  color: var(--bg-primary);
  border: none;
  padding: 12px 24px;
  border-radius: 24px;
  font-weight: 600;
  font-size: 0.95rem;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 8px;
  transition: background-color 0.2s, transform 0.1s;
}

.btn-primary:hover {
  background: #272727;
}
EOF
git add src/app/globals.css && git commit -m "style: add btn-primary hover state"

# Commit 28: Add btn-primary active
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
  --text-secondary: #606060;
  --accent-color: #0f0f0f;
  --accent-blue: #0066ff;
  --accent-green: #00c853;
  --accent-purple: #7c3aed;
  --font-family: var(--font-geist-sans), -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
  background-color: var(--bg-primary);
  color: var(--text-primary);
  font-family: var(--font-family);
  height: 100vh;
  width: 100vw;
  overflow: hidden;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.btn-primary {
  background: var(--text-primary);
  color: var(--bg-primary);
  border: none;
  padding: 12px 24px;
  border-radius: 24px;
  font-weight: 600;
  font-size: 0.95rem;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 8px;
  transition: background-color 0.2s, transform 0.1s;
}

.btn-primary:hover {
  background: #272727;
}

.btn-primary:active {
  transform: scale(0.98);
}
EOF
git add src/app/globals.css && git commit -m "style: add btn-primary active state scale"

# Commit 29: Add btn-secondary base
cat > src/app/globals.css << 'EOF'
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --bg-tertiary: #f2f2f2;
  --border-color: #e5e5e5;
  --border-hover: #cccccc;
  --text-primary: #0f0f0f;
  --text-secondary: #606060;
  --accent-color: #0f0f0f;
  --accent-blue: #0066ff;
  --accent-green: #00c853;
  --accent-purple: #7c3aed;
  --font-family: var(--font-geist-sans), -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
  background-color: var(--bg-primary);
  color: var(--text-primary);
  font-family: var(--font-family);
  height: 100vh;
  width: 100vw;
  overflow: hidden;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.btn-primary {
  background: var(--text-primary);
  color: var(--bg-primary);
  border: none;
  padding: 12px 24px;
  border-radius: 24px;
  font-weight: 600;
  font-size: 0.95rem;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 8px;
  transition: background-color 0.2s, transform 0.1s;
}

.btn-primary:hover {
  background: #272727;
}

.btn-primary:active {
  transform: scale(0.98);
}

.btn-secondary {
  background: transparent;
  color: var(--text-primary);
  border: 1px solid var(--border-color);
  padding: 12px 24px;
  border-radius: 24px;
  font-weight: 600;
  font-size: 0.95rem;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 8px;
  transition: border-color 0.2s, background-color 0.2s;
}

.btn-secondary:hover {
  border-color: var(--border-hover);
  background: var(--bg-secondary);
}
EOF
git add src/app/globals.css && git commit -m "style: add btn-secondary with border styles"

echo "Phase 2 globals.css complete"
