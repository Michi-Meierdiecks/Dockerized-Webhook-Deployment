# Dockerized Webhook Deployment

Dieses Projekt bietet eine einfache Möglichkeit, einen Docker-Container zu erstellen und zu verwalten, der Webhooks nutzt, um automatisierte Deployments durchzuführen.

## Voraussetzungen

- Ein Server oder eine VM mit Ubuntu (vorzugsweise 20.04 oder neuer)
- Benutzer mit sudo-Rechten

## Installation

1. **Klonen Sie dieses Repository:**

    ```bash
    git clone https://github.com/Michi-Meierdiecks/Dockerized-Webhook-Deployment.git
    cd Dockerized-Webhook-Deployment
    ```

2. **Führen Sie das Installationsskript aus:**

    ```bash
    chmod +x install.sh
    ./install.sh
    ```

## Nutzung

1. **Starten Sie Docker Compose:**

    Wenn das Installationsskript abgeschlossen ist, wird Docker Compose automatisch gestartet. Um Docker Compose manuell zu starten, navigieren Sie in das Verzeichnis des geklonten Repositories und führen Sie den folgenden Befehl aus:

    ```bash
    sudo docker-compose up -d --build
    ```

2. **Überprüfen Sie, ob der Container läuft:**

    ```bash
    sudo docker ps
    ```

    Sie sollten einen laufenden Container mit dem Namen `webhookd-deploy` sehen.

3. **Fügen Sie Ihr eigenes Repository hinzu:**

    Um Ihr eigenes Repository zu konfigurieren, bearbeiten Sie die `docker-compose.yml` Datei und passen Sie die entsprechenden Zeilen an:

    ```yaml
    environment:
      REPO_URL: "https://github.com/IhrBenutzername/IhrRepository.git"
      REPO_BRANCH: "main"
    ```

4. **Webseite aufrufen:**

    Rufen Sie die IP-Adresse Ihres Servers in einem Webbrowser auf, um die gehostete Webseite zu sehen.

## Troubleshooting

Wenn Sie Probleme haben, überprüfen Sie die Logs des Containers:

```bash
sudo docker logs webhookd-deploy
