#!/bin/bash

# Verzeichnis, in dem das neue Repository geklont wird
REPO_DIR="/home/ubuntu/new-repo"

# Verzeichnis der HTML-Dateien (Apache-Root-Verzeichnis)
WEB_DIR="/var/www/html"

# Das Repository des Nutzers (über Umgebungsvariable)
USER_REPO=$1

# Falls das Repository-Verzeichnis nicht existiert, klonen Sie das neue Repository
if [ ! -d "$REPO_DIR" ]; then
  git clone $USER_REPO $REPO_DIR
fi

# Wechseln Sie in das Repository-Verzeichnis
cd $REPO_DIR

# Aktualisieren Sie das Repository
git pull origin main

# Kopieren Sie die HTML-Dateien in das Apache-Webverzeichnis
cp -r $REPO_DIR/*.html $WEB_DIR

# Apache neu starten, um die Änderungen zu übernehmen
systemctl restart apache2
