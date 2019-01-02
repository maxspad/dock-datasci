#!/bin/bash

# Install git
apt-get -y update
apt-get -y install git

# Get our code repo
git clone https://github.com/maxspad/dock-datasci
cd dock-datasci

# Make the secrets directory (filled later)
mkdir secrets

# Build our image
docker build -t notebook notebooks/