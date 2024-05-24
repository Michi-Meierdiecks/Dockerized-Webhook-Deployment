#!/bin/bash

# Update package list and install necessary packages
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common git -y

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker's APT repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package list again
sudo apt update

# Install Docker
sudo apt install docker-ce docker-ce-cli containerd.io -y

# Start Docker service and enable it to start on boot
sudo systemctl start docker
sudo systemctl enable docker

# Add current user to the Docker group
sudo usermod -aG docker $USER

# Allow port 9000 through the firewall
sudo ufw allow 9000

# Apply new group membership
newgrp docker

# Clone the repository and start the Docker container
git clone https://github.com/Michi-Meierdiecks/Dockerized-Webhook-Deployment.git
cd Dockerized-Webhook-Deployment

# Build and run the Docker container
sudo docker-compose up -d --build

echo "Setup complete. Please log out and log back in to apply Docker group changes."
