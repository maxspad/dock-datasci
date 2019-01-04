
FROM jupyter/minimal-notebook

ARG self_signed

# USER root
# RUN apt-get update
# RUN apt-get install git

USER jovyan
COPY my_run_server.sh /home/jovyan
ENV GEN_CERT ${self_signed}
ENV SELF_SIGNED ${self_signed}

ENTRYPOINT ["/bin/bash", "./my_run_server.sh"]
