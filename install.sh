#!/bin/bash


echo "Updating package index and installing dependencies..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release


echo "Adding Docker's official GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg


echo "Setting up Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


echo "Installing Docker Engine..."
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin


echo "Verifying Docker installation..."
sudo docker run hello-world


echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose


echo "Setting executable permissions for Docker Compose..."
sudo chmod +x /usr/local/bin/docker-compose


echo "Verifying Docker Compose installation..."
docker-compose --version


echo "Cloning the repository..."
git clone https://github.com/Michi-Meierdiecks/Dockerized-Webhook-Deployment.git
cd Dockerized-Webhook-Deployment


echo "Please configure your repository in the docker-compose.yml file."
read -p "Press [Enter] to open the file in nano editor..."
nano docker-compose.yml


echo "Starting Docker Compose..."
sudo docker-compose up -d --build

echo "Installation and setup complete. Your application should be running now."
