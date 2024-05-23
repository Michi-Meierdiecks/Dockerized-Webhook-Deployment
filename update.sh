#!/bin/bash

cd /home/ubuntu/selfmade-pipeline/auto-deploy-website
git pull

cp -r /home/ubuntu/selfmade-pipeline/auto-deploy-website/* /var/www/html/

service apache2 restart
