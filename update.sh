#!/bin/bash
cd /home/ubuntu/Dockerized-Webhook-Deployment
git pull origin main
sudo systemctl restart apache2
