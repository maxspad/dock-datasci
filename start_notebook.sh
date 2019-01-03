#!/bin/bash

repo_name="dock-datasci"

while [ "$2" != "" ]; do
    case $2 in
        -r | --repo_name )      shift
                                repo_name=$2
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

if [ $1 = "server" ]
then
    repo_dir="/root/$repo_name"
    echo "Setting permissions..."
    chmod -R 777 $repo_dir/server/secrets/
    chmod -R 777 $repo_dir/src/
    echo "Starting on server..."
    docker run --rm -it \
        -p 443:8888 \
        -v $repo_dir:/home/jovyan/work \
        -e CHOWN_HOME=yes \
        -e CHOWN_HOME_OPTS='-R' \
        notebook \
        /bin/bash -c " \
        jupyter notebook password; \
        start.sh jupyter notebook \
            --certfile /home/jovyan/work/$repo_name/server/secrets/fullchain.pem \
            --keyfile /home/jovyan/work/$repo_name/server/secrets/privkey.pem"
fi

if [ $1 = "local" ]
then
    echo "local"
fi
#            #--NotebookApp.password="$(cat /root/dock-datasci/secrets/jupyterpw.txt)" \
# -v /root/dock-datasci/src:/home/jovyan/work \
        # -v /root/dock-datasci/secrets:/etc/ssl/notebook/ \