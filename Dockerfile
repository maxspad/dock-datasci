FROM jupyter/datascience-notebook

USER root
RUN apt-get update
RUN apt-get install git

USER jovyan

