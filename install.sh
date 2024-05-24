#!/bin/bash

# Update des Paketindex und Installation von Abhängigkeiten
echo "Updating package index and installing dependencies..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Docker's offizieller GPG-Schlüssel hinzufügen
echo "Adding Docker's official GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Setup des Docker-Repository
echo "Setting up Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Installation von Docker Engine
echo "Installing Docker Engine..."
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Überprüfen der Docker-Installation
echo "Verifying Docker installation..."
sudo docker run hello-world

# Docker Compose installieren
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Geben Sie die notwendigen Berechtigungen
echo "Setting executable permissions for Docker Compose..."
sudo chmod +x /usr/local/bin/docker-compose

# Überprüfen der Docker Compose-Installation
echo "Verifying Docker Compose installation..."
docker-compose --version

# Klonen des Repositorys
echo "Cloning the repository..."
git clone https://github.com/Michi-Meierdiecks/Dockerized-Webhook-Deployment.git
cd Dockerized-Webhook-Deployment

# Benutzer auffordern, sein Repository hinzuzufügen
echo "Please configure your repository in the docker-compose.yml file."
read -p "Press [Enter] to open the file in nano editor..."
nano docker-compose.yml

# Docker Compose starten
echo "Starting Docker Compose..."
sudo docker-compose up -d --build

echo "Installation and setup complete. Your application should be running now."
