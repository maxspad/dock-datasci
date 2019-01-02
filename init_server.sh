#!/bin/bash

apt-get update
apt-get install git
git clone https://github.com/maxspad/dock-datasci
cd dock-datasci
docker build -t notebook notebooks/