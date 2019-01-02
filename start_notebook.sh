#!/bin/bash

if [ $1 = "server" ]
then
    echo "Starting on server..."
    docker run --rm -it \
        -p 443:8888 \
        -v /root/dock-datasci/work:/home/jovyan/work \
        -v /root/dock-datasci/secrets:/home/jovyan/secrets \
        -e CHOWN_HOME=yes \
        -e CHOWN_HOME_OPTS='-R' \
        notebook \
        /bin/bash -c " \
        jupyter notebook password; \
        start.sh jupyter notebook \
            --certfile /home/jovyan/secrets/fullchain.pem \
            --keyfile /home/jovyan/secrets/privkey.pem"
fi

if [ $1 = "local" ]
then
    echo "local"
fi
#            #--NotebookApp.password="$(cat /root/dock-datasci/secrets/jupyterpw.txt)" \
