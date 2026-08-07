"use client";

import React, { useState } from "react";
import Link from "next/link";

export default function Navbar() {
  return (
    <nav className="navbar">
      <div className="navbar-container">
        <div className="navbar-logo">
          <Link href="/">
            <span className="logo-text">DROP</span>
          </Link>
        </div>
        <div className="navbar-links">
          <Link href="/" className="nav-link">Home</Link>
        </div>
      </div>
    </nav>
  );
}
