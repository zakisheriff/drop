"use client";

import React from "react";
import styles from "./TeamCard.module.css";

interface TeamCardProps {
  name: string;
  role: string;
  avatar: string;
}

export default function TeamCard({ name, role, avatar }: TeamCardProps) {
  return (
    <div className={styles.teamCard}>
      <div className={styles.teamAvatar}>
        <span>{avatar}</span>
      </div>
      <h3 className={styles.teamName}>{name}</h3>
      <p className={styles.teamRole}>{role}</p>
    </div>
  );
}
