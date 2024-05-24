#!/bin/bash

# Start Apache
service apache2 start

# Start webhook
webhook -hooks /home/ubuntu/webhooks/hooks.json -verbose
