#!/bin/bash


usage() {
    echo "Help text goes here..."
}

## MAIN
repo_name="$(basename `pwd`)" # name of repository we're working in
github_user="maxspad"
server_addr="steponmy.com"

while [ "$1" != "" ]; do
    case $1 in
        -r | --repo_name )      shift
                                repo_name=$1
                                ;;
        -s | --server_addr )    shift
                                server_addr=$1
                                ;;
        -u | --user-github )    shift
                                github_user=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

echo "Using $repo_name as repository"
echo "Using $server_addr as server domain/IP"
echo "Using $github_user as github user"

# Get rid of error from floating IP
echo "Removing old known_hosts record for $server_addr"
ssh-keygen -f "/home/max/.ssh/known_hosts" -R "$server_addr"

# Provision server
ssh root@$server_addr /bin/bash -c "
    echo 'Installing git...'
    apt-get -y update
    apt-get -y install git

    echo 'Cloning repository...'
    git clone https://github.com/$github_user/$repo_name
    cd $repo_name

    mkdir secrets

    echo 'Building notebook image...'
    docker build -t notebook src/"

# Image is built, push secret keys/passwords 
echo "Copying secrets..."
scp -r server/secrets/ root@steponmy.com:/root/$repo_name/

echo "Done. You may now SSH into the server and run /root/$repo_name/start_notebook.sh server to create a password and start the notebook server."

# # Get our code repo
# echo "Cloning repository..."
# git clone https://github.com/maxspad/dock-datasci
# cd dock-datasci

# # Make the secrets directory (filled later)
# mkdir secrets

# # Build our image
# echo "Building notebook image..."
# docker build -t notebook notebooks/

# # Push our server init.sh script up
# echo "Pushing init script to $server_addr..."
# scp init_server.sh root@$server_addr:/root/

# # Run it
# echo "Running it..."
# ssh root@$server_addr /bin/bash /root/init_server.sh -r $repo_name



# # Start server...
# ssh root@steponmy.com /bin/bash -c "/root/dock-datasci/start_notebook.sh server"
