FROM ubuntu:latest

# Set the working directory
WORKDIR /home/ubuntu/Dockerized-Webhook-Deployment

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 git wget && \
    rm -rf /var/lib/apt/lists/*

# Download and extract webhook
RUN wget https://github.com/adnanh/webhook/releases/download/2.8.0/webhook-linux-amd64.tar.gz && \
    tar -xzf webhook-linux-amd64.tar.gz && \
    mv webhook-linux-amd64/webhook /usr/local/bin/webhook && \
    chmod +x /usr/local/bin/webhook

# Clone your repository
RUN git clone https://github.com/Michi-Meierdiecks/Dockerized-Webhook-Deployment.git .

# Copy configuration and scripts
COPY hooks.json /home/ubuntu/webhooks/hooks.json
COPY start.sh /start.sh
COPY update.sh /home/ubuntu/Dockerized-Webhook-Deployment/update.sh

# Make scripts executable
RUN chmod +x /start.sh /home/ubuntu/Dockerized-Webhook-Deployment/update.sh

# Expose the necessary port
EXPOSE 9000

# Start the webhook and Apache server
CMD ["/start.sh"]
