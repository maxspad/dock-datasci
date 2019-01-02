#!/bin/bash

# Get rid of error from floating IP
echo "Cleaning known hosts..."
ssh-keygen -f "/home/max/.ssh/known_hosts" -R "steponmy.com"

# Push our server init.sh script up
echo "Copying server init script..."
scp init_server.sh root@steponmy.com:/root/

# Run it
echo "Running it..."
ssh root@steponmy.com /bin/bash /root/init_server.sh

# Image is built, push secret keys/passwords 
echo "Copying secrets..."
scp -r secrets/ root@steponmy.com:/root/dock-datasci/secrets/

# Start server...
ssh root@steponmy.com /bin/bash -c "/root/dock-datasci/start_notebook.sh server"
