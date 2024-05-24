#!/bin/bash


REPO_DIR="/home/ubuntu/new-repo"


WEB_DIR="/var/www/html"


USER_REPO=$1


if [ ! -d "$REPO_DIR" ]; then
  git clone $USER_REPO $REPO_DIR
fi


cd $REPO_DIR


git pull origin main


cp -r $REPO_DIR/*.html $WEB_DIR


systemctl restart apache2
