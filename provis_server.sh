#!/bin/bash

# Get rid of error from floating IP
ssh-keygen -f "/home/max/.ssh/known_hosts" -R "steponmy.com"

# Push our server init.sh script up
scp init_server.sh root@steponmy.com:/root/

# Run it
ssh root@steponmy.com /bin/bash /root/init_server.sh

# Image is built, push secret keys/passwords 
scp secrets/ root@steponmy.com:/root/dock-datasci/secrets/
