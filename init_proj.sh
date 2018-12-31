#!/bin/bash

# # Initialize the project directories
# mkdir secrets
# mkdir work
# touch Dockerfile
# echo "secrets/*" > .gitignore

# # # Prep doctl
# curl -sL https://github.com/digitalocean/doctl/releases/download/v1.12.2/doctl-1.12.2-linux-amd64.tar.gz | tar -xzv
# export DIGITALOCEAN_ACCESS_TOKEN=$1
# echo $DIGITALOCEAN_ACCESS_TOKEN > secrets/DOtoken.txt

# # Spawn our container
# ./doctl compute droplet create dock-datasci \
# --format ID \
# --no-header \
# --image ubuntu-18-04-x64 \
# --region nyc1 \
# --verbose \
# --wait \
# --ssh-keys 0c:4a:c6:51:09:76:d1:6b:c6:ff:48:46:97:cc:d8:2e \
# --ssh-keys 22:9c:c0:92:28:55:31:47:73:c6:2d:f2:6b:08:6b:a7 \
# --size 1gb 

# # Get container ID
# CONTAINER_ID=`./doctl compute droplet list --format ID --no-header`

# # Assign our IP
# ./doctl compute floating-ip-action assign 178.128.133.194 $CONTAINER_ID

# Fix known hosts
ssh-keygen -f "/home/max/.ssh/known_hosts" -R "178.128.133.194"
ssh-keygen -f "/home/max/.ssh/known_hosts" -R "steponmy.com"

scp certserver_init.sh root@steponmy.com:~/certserver_init.sh
ssh root@steponmy.com


