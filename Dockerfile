FROM jupyter/datascience-notebook:822f02b8ce23

USER root
RUN apt-get update && apt-get install -y git perl openssh-client

USER jovyan

# So we don't have to do this annoying step....
RUN git config --global user.email "maxspad@umich.edu" && git config --global user.name "Maxwell Spadafore"

################### INSTALL NOTEBOOK EXTENSIONS ################################
# Git Extension
RUN jupyter labextension install -y --debug @jupyterlab/git && \
pip install --upgrade jupyterlab-git && \
jupyter serverextension enable --debug --py jupyterlab_git

# Table of Contents Extension
RUN jupyter labextension install @jupyterlab/toc

# Plotting Widgets Extension
RUN pip install ipympl && \
jupyter labextension install -y --debug @jupyter-widgets/jupyterlab-manager && \
jupyter labextension install -y --debug jupyter-matplotlib

# Sql Extension
RUN pip install jupyterlab_sql && \
jupyter serverextension enable --debug jupyterlab_sql --py --sys-prefix && \
jupyter lab build

################### INSTALL REQUIRED PACKAGES ################################
# Google Cloud SDK
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-242.0.0-linux-x86_64.tar.gz && \
tar zxvf google-cloud-sdk-242.0.0-linux-x86_64.tar.gz google-cloud-sdk && \
./google-cloud-sdk/install.sh --usage-reporting false --quiet

# Python Packages
COPY py_requirements.txt ./py_requirements.txt
RUN pip install -r ./py_requirements.txt
RUN python -m spacy download en_core_web_sm





