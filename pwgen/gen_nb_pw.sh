#!/bin/bash

echo "Generating password in docker container..."
docker build -t nb-pw-generator .
docker run --rm -it --mount "type=bind,src=$(pwd),dst=/home/jovyan" nb-pw-generator
mv nbpw.txt ../secrets