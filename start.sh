#!/bin/bash

# Apache starten
service apache2 start

# Webhook starten
webhook -hooks /home/ubuntu/webhooks/hooks.json -verbose &

# Warten, damit der Benutzer das Repository festlegen kann
sleep 10

# Führen Sie das Update-Skript mit dem Benutzer-Repository aus, wenn es angegeben ist
if [ ! -z "$USER_REPO" ]; then
  /home/ubuntu/Dockerized-Webhook-Deployment/update.sh $USER_REPO
fi

# Halten Sie den Container am Laufen
tail -f /dev/null
