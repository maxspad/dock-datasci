echo "Generating password in docker container..."
docker build -t nb-pw-generator $PSScriptRoot
docker run --rm -it --mount "type=bind,src=$PSScriptRoot,dst=/home/jovyan" nb-pw-generator
mv $PSScriptRoot\nbpw.txt $PSScriptRoot\..\secrets
