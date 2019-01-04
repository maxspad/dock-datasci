#!/bin/bash


# echo "Well, we got here..."
# echo ${SELF_SIGNED}

# echo "Generating password..."
# jupyter notebook password

pw="$(cat /run/secrets/nbpw)"
if [ $SELF_SIGNED = "no" ]
then
    echo "my_run_server: Using real SSL cert"
    echo $GEN_CERT
    export GEN_CERT=""
    # For some reason this will still self-generate a certificate, but it won't be used
    start.sh jupyter notebook \
    --NotebookApp.certfile=/run/secrets/cert \
    --NotebookApp.keyfile=/run/secrets/privkey \
    --NotebookApp.password=$pw
fi

if [ $SELF_SIGNED = "yes" ]
then
    echo "my_run_server: Self-signing"
    start.sh jupyter notebook \
    --NotebookApp.password=$pw
fi
