FROM jupyter/minimal-notebook

USER root
RUN apt-get install -y git

USER jovyan
