# Use the official Ubuntu as a parent image
FROM ubuntu:latest

# Set the working directory
WORKDIR /home/ubuntu/Dockerized-Webhook-Deployment

# Install dependencies
RUN apt-get update && \
    apt-get install -y apache2 git wget && \
    rm -rf /var/lib/apt/lists/*

# Clone the repository
RUN git clone https://github.com/Michi-Meierdiecks/Dockerized-Webhook-Deployment.git .

# Download webhook
RUN wget https://github.com/adnanh/webhook/releases/download/2.8.0/webhook-linux-amd64.tar.gz && \
    tar -xzf webhook-linux-amd64.tar.gz -C /usr/local/bin

# Copy necessary files
COPY hooks.json /home/ubuntu/webhooks/hooks.json
COPY start.sh /start.sh
COPY update.sh /home/ubuntu/Dockerized-Webhook-Deployment/update.sh

# Make the scripts executable
RUN chmod +x /start.sh /home/ubuntu/Dockerized-Webhook-Deployment/update.sh

# Expose the necessary ports
EXPOSE 80 9000

# Start the webhook
CMD ["/start.sh"]
