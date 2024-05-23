#!/bin/bash

cd /home/ubuntu/selfmade-pipeline/auto-deploy-website

git pull origin main

sudo cp -r * /var/www/html/

sudo systemctl restart apache2