#!/bin/bash

cd /home/ubuntu/selfmade-pipeline/auto-deploy-website
git pull origin main
cp index.html /var/www/html/
service apache2 restart
