#!/bin/bash

if [ $1 = "server" ]
then
    echo "Setting perimssions..."
    chmod -R 777 secrets/
    chmod -R 777 work/
    echo "Starting on server..."
    docker run --rm -it \
        -p 443:8888 \
        -v /root/dock-datasci/work:/home/jovyan/work \
        -v /root/dock-datasci/secrets:/etc/ssl/notebook/ \
        -e CHOWN_HOME=yes \
        -e CHOWN_HOME_OPTS='-R' \
        notebook \
        /bin/bash -c " \
        jupyter notebook password; \
        start.sh jupyter notebook \
            --certfile /etc/ssl/notebook/fullchain.pem \
            --keyfile /etc/ssl/notebook//privkey.pem"
fi

if [ $1 = "local" ]
then
    echo "local"
fi
#            #--NotebookApp.password="$(cat /root/dock-datasci/secrets/jupyterpw.txt)" \
