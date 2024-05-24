FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    apache2 \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/adnanh/webhook/releases/download/2.8.0/webhook-linux-amd64.tar.gz \
    && tar -zxvf webhook-linux-amd64.tar.gz \
    && mv webhook-linux-amd64/webhook /usr/local/bin/webhook \
    && chmod +x /usr/local/bin/webhook \
    && rm -rf webhook-linux-amd64.tar.gz webhook-linux-amd64

RUN mkdir -p /home/ubuntu/selfmade-pipeline/auto-deploy-website /home/ubuntu/webhooks

WORKDIR /home/ubuntu/selfmade-pipeline/auto-deploy-website

RUN git clone https://github.com/Michi-Meierdiecks/auto-deploy-website.git .

COPY hooks.json /home/ubuntu/webhooks/hooks.json
COPY update.sh /home/ubuntu/selfmade-pipeline/auto-deploy-website/update.sh
COPY start.sh /start.sh

RUN chmod +x /home/ubuntu/selfmade-pipeline/auto-deploy-website/update.sh /start.sh

EXPOSE 80 9000

CMD ["/start.sh"]
