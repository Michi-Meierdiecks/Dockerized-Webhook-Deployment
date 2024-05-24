FROM ubuntu:latest


WORKDIR /home/ubuntu/Dockerized-Webhook-Deployment


RUN apt-get update && \
    apt-get install -y apache2 git wget && \
    rm -rf /var/lib/apt/lists/*


RUN wget https://github.com/adnanh/webhook/releases/download/2.8.0/webhook-linux-amd64.tar.gz && \
    tar -xzf webhook-linux-amd64.tar.gz && \
    mv webhook-linux-amd64/webhook /usr/local/bin/webhook && \
    chmod +x /usr/local/bin/webhook


RUN rm -rf /home/ubuntu/Dockerized-Webhook-Deployment/* && \
    git clone https://github.com/Michi-Meierdiecks/Dockerized-Webhook-Deployment.git .


COPY hooks.json /home/ubuntu/webhooks/hooks.json
COPY start.sh /start.sh
COPY update.sh /home/ubuntu/Dockerized-Webhook-Deployment/update.sh


RUN chmod +x /start.sh /home/ubuntu/Dockerized-Webhook-Deployment/update.sh


EXPOSE 9000


CMD ["/start.sh"]
