FROM ubuntu:latest

# Set the working directory
WORKDIR /home/ubuntu/Dockerized-Webhook-Deployment

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 git wget && \
    rm -rf /var/lib/apt/lists/*

# Clone your repository
RUN git clone https://github.com/Michi-Meierdiecks/Dockerized-Webhook-Deployment.git .

# Download and extract webhook
RUN wget https://github.com/adnanh/webhook/releases/download/2.8.0/webhook-linux-amd64.tar.gz && \
    tar -xzf webhook-linux-amd64.tar.gz && \
    mv webhook-linux-amd64/webhook /usr/local/bin/webhook && \
    chmod +x /usr/local/bin/webhook && \
    rm -rf webhook-linux-amd64*

# Copy hook configuration
COPY hooks.json /home/ubuntu/webhooks/hooks.json

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Copy update script
COPY update.sh /home/ubuntu/Dockerized-Webhook-Deployment/update.sh
RUN chmod +x /home/ubuntu/Dockerized-Webhook-Deployment/update.sh

# Expose ports
EXPOSE 80 9000

# Start the webhook service
CMD ["/start.sh"]
