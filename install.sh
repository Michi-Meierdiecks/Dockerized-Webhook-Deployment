#!/bin/bash

# Aktualisiere die Paketliste und installiere benötigte Pakete
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common git -y

# Füge den Docker GPG-Schlüssel hinzu
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Füge das Docker Repository hinzu
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Aktualisiere die Paketliste erneut
sudo apt update

# Installiere Docker
sudo apt install docker-ce -y

# Starte den Docker-Dienst und aktiviere ihn, damit er beim Booten startet
sudo systemctl start docker
sudo systemctl enable docker

# Füge den aktuellen Benutzer zur Docker-Gruppe hinzu
sudo usermod -aG docker $USER

# Setze die Firewall-Regeln, um Port 8080 und Port 80 freizugeben
sudo ufw allow 8080
sudo ufw allow 80

# Aktualisiere die Gruppenzugehörigkeit im laufenden Terminal
newgrp docker

# Installiere Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Klone das Git-Repository
git clone https://github.com/Michi-Meierdiecks/Dockerized-Webhook-Deployment.git
cd Dockerized-Webhook-Deployment

# Baue und starte das Docker-Compose Projekt
docker-compose up -d --build
