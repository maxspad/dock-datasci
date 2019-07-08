FROM jupyter/datascience-notebook

USER root
RUN apt-get update && apt-get install -y git perl openssh-client

USER jovyan
RUN pip install ipympl
RUN git config --global user.email "maxspad@umich.edu" && git config --global user.name "Maxwell Spadafore"
# RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
# RUN jupyter labextension install jupyter-matplotlib
RUN jupyter labextension install @jupyterlab/toc
