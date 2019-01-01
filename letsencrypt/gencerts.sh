#!/bin/bash

# If we're self-signing
if [$1 = 'self-sign']
then
    echo "Self-signing the certificate"
    openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout privkey.pem -out cert.pem
fi

if [$1 = 'certbot']
then
    echo 'Using certbot to generate the certificates'
    certbot certonly \
    --standalone \
    --non-interactive \
    --keep \
    -d steponmy.com