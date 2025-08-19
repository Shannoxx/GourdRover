#!/bin/bash

# ##################################################################
# Script to install ROS 2 Jazzy Jalisco on Ubuntu 24.04
# ##################################################################

# --- Set Locale ---
echo "[INFO] Setting system locale to en_US.UTF-8..."
sudo apt update && sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

echo "[INFO] Locale set."
echo "---"

# --- Add ROS 2 APT Repository ---
echo "[INFO] Adding the ROS 2 APT repository..."
sudo apt install software-properties-common -y
sudo add-apt-repository universe -y

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

echo "[INFO] Repository added."
echo "---"

# --- Install ROS 2 Packages ---
echo "[INFO] Updating package lists and installing ROS 2 Jazzy..."
sudo apt update
sudo apt upgrade -y

# This installs the full desktop version (ROS, RViz, demos, tutorials)
sudo apt install ros-jazzy-desktop -y

# Install development tools for building packages
sudo apt install ros-dev-tools -y

echo "[INFO] ROS 2 installation complete."
echo "---"

# --- Source the Setup File ---
echo "[INFO] Sourcing ROS 2 environment and adding to .bashrc..."

# Source for the current shell
source /opt/ros/jazzy/setup.bash

# Add sourcing to .bashrc for future terminal sessions
echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc

echo "[INFO] Setup complete!"
echo "✅ ROS 2 Jazzy is installed. Please restart your terminal or run 'source ~/.bashrc' to use ROS 2 commands."
