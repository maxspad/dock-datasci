#!/bin/bash

# Install git
echo "Installing git..."
apt-get -y update
apt-get -y install git

# Get our code repo
echo "Cloning repository..."
git clone https://github.com/maxspad/dock-datasci
cd dock-datasci

# Make the secrets directory (filled later)
mkdir secrets

# Build our image
echo "Building notebook image..."
docker build -t notebook notebooks/