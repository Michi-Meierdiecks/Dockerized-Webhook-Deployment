#!/bin/bash

sudo apt update
sudo apt install -y git


sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce


sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker $USER

sudo ufw allow 8080
sudo ufw allow 80

echo "Bitte melden Sie sich ab und wieder an oder führen Sie 'newgrp docker' aus, um die Änderungen zu übernehmen."
