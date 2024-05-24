#!/bin/bash

REPO_DIR="/home/ubuntu/Dockerized-Webhook-Deployment"
cd $REPO_DIR

# Überprüfen, ob es ein Git-Repository ist
if [ -d .git ]; then
  echo "Pulling latest changes from the repository..."
  git pull origin main
else
  echo "Error: Not a Git repository."
  exit 1
fi

# Falls ein Neustart des Webservers oder andere Aktionen erforderlich sind, können diese hier hinzugefügt werden
echo "Deployment completed successfully."
