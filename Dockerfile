FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y apache2 git wget && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/adnanh/webhook/releases/download/2.8.0/webhook-linux-amd64.tar.gz && \
    tar -zxvf webhook-linux-amd64.tar.gz && \
    mv webhook-linux-amd64/webhook /usr/local/bin/webhook

RUN mkdir -p /home/ubuntu/webhooks

WORKDIR /home/ubuntu/webhooks

COPY hooks.json /home/ubuntu/webhooks/hooks.json
COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 80 9000

CMD ["/start.sh"]
