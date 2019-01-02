#! /bin/bash
echo "Placing jupyter password hash in secrets/jupyterpw.txt"
docker run -it jupyter/datascience-notebook python -c "from notebook.auth import passwd; print(passwd())" | tail -n 1 > secrets/jupyterpw.txt