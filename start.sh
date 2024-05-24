#!/bin/bash


service apache2 start


webhook -hooks /home/ubuntu/webhooks/hooks.json -verbose &


sleep 10


if [ ! -z "$USER_REPO" ]; then
  /home/ubuntu/Dockerized-Webhook-Deployment/update.sh $USER_REPO
fi


tail -f /dev/null
