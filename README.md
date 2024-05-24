# Docker Deployment Script

Dieses Skript installiert Docker, konfiguriert die Firewall, klont ein Git-Repository und startet einen Docker-Container.

## Anleitung

1. **EC2-Instanz vorbereiten:**
   - Melden Sie sich bei Ihrer EC2-Instanz an.

2. **Installationsskript ausführen:**

```sh
# Installationsskript herunterladen und ausführen
wget https://raw.githubusercontent.com/Michi-Meierdiecks/docker-deplay-puplic/main/install.sh
chmod +x install.sh
./install.sh
