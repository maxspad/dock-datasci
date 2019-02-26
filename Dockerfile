FROM jupyter/datascience-notebook

USER root
RUN apt-get install -y git

USER jovyan
