#!/bin/bash

# Update the package list and install necessary packages
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common git

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker's APT repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the package list again and install Docker
sudo apt update
sudo apt install -y docker-ce

# Start Docker service and enable it to start on boot
sudo systemctl start docker
sudo systemctl enable docker

# Add your user to the Docker group
sudo usermod -aG docker $USER

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Pull the repository and set up the project
git clone https://github.com/Michi-Meierdiecks/Dockerized-Webhook-Deployment.git
cd Dockerized-Webhook-Deployment

# Set the execute permission for the scripts
chmod +x start.sh update.sh

# Run Docker Compose to build and start the containers
docker-compose up -d --build

echo "Setup complete. Please log out and log back in to apply Docker group changes."
