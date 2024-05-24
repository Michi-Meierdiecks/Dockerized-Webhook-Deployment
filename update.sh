#!/bin/bash

# Pfad zum Arbeitsverzeichnis
WORKDIR="/home/ubuntu/Dockerized-Webhook-Deployment"

# Zum Arbeitsverzeichnis wechseln
cd $WORKDIR

# Repository aktualisieren
git pull origin main

# Apache-Server neu starten
sudo systemctl restart apache2
