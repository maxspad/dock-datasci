if [ $1 = "server" ]
then
    echo "Starting on server..."
    docker --rm \
        -p 443:8888 \ 
        -v /root/dock-datasci/work:/home/jovyan/work \
        -v /root/dock-datasci/secrets:/home/jovyan/secrets \
        start.sh jupyter notebook \
            --NotebookApp.password="$(cat /home/jovyan/secrets/jupyterpw.txt)" \
            --certfile /home/jovyan/secrets/fullchain.pem \
            --keyfile /home/jovyan/secrets/privkey.pem
fi

if [ $1 = "local" ]
then
    echo "local"
fi