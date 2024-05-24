FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y apache2 git wget && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/adnanh/webhook/releases/download/2.8.0/webhook-linux-amd64.tar.gz && \
    tar -xzvf webhook-linux-amd64.tar.gz && \
    mv webhook-linux-amd64/webhook /usr/local/bin/webhook && \
    rm -rf webhook-linux-amd64*

RUN mkdir -p /home/ubuntu/webhooks

WORKDIR /home/ubuntu/webhooks

COPY hooks.json /home/ubuntu/webhooks/hooks.json
COPY start.sh /start.sh
COPY update.sh /home/ubuntu/Dockerized-Webhook-Deployment/update.sh

RUN chmod +x /start.sh /home/ubuntu/Dockerized-Webhook-Deployment/update.sh

CMD ["/start.sh"]
