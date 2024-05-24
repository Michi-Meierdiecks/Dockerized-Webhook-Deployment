# Dockerized Webhook Deployment

Dieses Repository bietet eine Lösung zur automatisierten Bereitstellung von Webseitenänderungen mittels Webhooks und Docker.

## Voraussetzungen

- Docker und Docker Compose müssen installiert sein.
- Ein GitHub- oder GitLab-Repository mit den zu bereitstellenden HTML-Dateien.

## Docker und Docker Compose installieren

### Docker installieren

1. **Update des Paketindex und Installation von Abhängigkeiten:**

    ```bash
    sudo apt-get update
    sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    ```

2. **Docker's offizieller GPG-Schlüssel hinzufügen:**

    ```bash
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    ```

3. **Setup des Docker-Repository:**

    ```bash
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ```

4. **Installation von Docker Engine:**

    ```bash
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    ```

5. **Überprüfen der Docker-Installation:**

    ```bash
    sudo docker run hello-world
    ```

### Docker Compose installieren

1. **Herunterladen der aktuellen Version von Docker Compose:**

    ```bash
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    ```

2. **Gebens Sie die notwendigen Berechtigungen:**

    ```bash
    sudo chmod +x /usr/local/bin/docker-compose
    ```

3. **Überprüfen der Docker Compose-Installation:**

    ```bash
    docker-compose --version
    ```

## Einrichtung

1. **Klonen Sie dieses Repository:**

    ```bash
    git clone https://github.com/Michi-Meierdiecks/Dockerized-Webhook-Deployment.git
    cd Dockerized-Webhook-Deployment
    ```

2. **Passen Sie die `docker-compose.yml`-Datei an:**

    Bearbeiten Sie die `docker-compose.yml`-Datei und fügen Sie Ihr eigenes Repository hinzu, indem Sie die Umgebungsvariable `USER_REPO` setzen:

    ```yaml
    version: '3.8'

    services:
      webhook:
        build: .
        ports:
          - "80:80"
          - "9000:9000"
        environment:
          - USER_REPO=https://github.com/IhrBenutzername/IhrRepository.git
    ```

3. **Starten Sie die Docker-Container:**

    ```bash
    sudo docker-compose up -d --build
    ```

    Dies baut das Docker-Image und startet die Container. Apache wird auf Port 80 laufen und der Webhook-Dienst auf Port 9000.

## Nutzung

1. **Richten Sie den Webhook ein:**

    Konfigurieren Sie Ihren Webhook-Dienst (z.B. GitHub, GitLab), um einen POST-Request an den folgenden Endpunkt zu senden:

    ```
    http://<Ihre_Server_IP>:9000/hooks/update-site
    ```

2. **Testen Sie den Webhook:**

    Senden Sie einen Test-POST-Request, um sicherzustellen, dass alles korrekt eingerichtet ist:

    ```bash
    curl -X POST http://localhost:9000/hooks/update-site
   
