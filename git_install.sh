#!/bin/bash

# ##################################################################
# Script to install and guide configuration for Git
# ##################################################################

# --- Update and Install Git ---
echo "[INFO] Updating package lists..."
apt update

echo "[INFO] Installing Git..."
apt install git -y

echo "[INFO] Git installation complete."
git --version
echo "---"

# --- Configuration Instructions ---
echo "[IMPORTANT] Git is installed, but you need to configure your identity."
echo "Run the following two commands, replacing the placeholder text with your name and email:"
echo ""
echo 'git config --global user.name "Your Name"'
echo 'git config --global user.email "youremail@example.com"'
echo ""
echo "✅ Git setup is finished once you run the configuration commands."
