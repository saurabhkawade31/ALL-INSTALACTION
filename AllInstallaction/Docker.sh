#!/bin/bash
set -e

echo "Step 1: Updating Ubuntu and adding Docker repository..."

sudo apt update
sudo apt install -y ca-certificates curl

sudo install -m 0755 -d /etc/apt/keyrings

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  -o /etc/apt/keyrings/docker.asc

sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Step 2: Installing Docker and Docker Compose..."

sudo apt update

sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl enable --now docker

echo "Step 3: Configuring Docker group..."

sudo usermod -aG docker "$USER"

echo "Installation completed!"
echo "Verify using: sudo docker --version"
echo "Verify Compose using: sudo docker compose version"
echo "Log out and log back in to apply docker group membership."
