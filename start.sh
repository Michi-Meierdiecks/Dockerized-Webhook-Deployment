#!/bin/bash

service apache2 start

webhook -hooks /home/ubuntu/webhooks/hooks.json -verbose
