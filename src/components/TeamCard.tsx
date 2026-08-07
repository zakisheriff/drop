"use client";

import React from "react";

interface TeamCardProps {
  name: string;
  role: string;
  avatar: string;
}

export default function TeamCard({ name, role, avatar }: TeamCardProps) {
  return (
    <div className="team-card">
      <div className="team-avatar">
        <span>{avatar}</span>
      </div>
      <h3 className="team-name">{name}</h3>
      <p className="team-role">{role}</p>
    </div>
  );
}
