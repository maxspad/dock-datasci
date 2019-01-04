
FROM jupyter/minimal-notebook

ARG self_signed
ARG repo_name=dock-datasci
ARG git_username=maxspad
# USER root
# RUN apt-get update
# RUN apt-get install git

USER jovyan
RUN git clone https://github.com/${git_username}/${repo_name} /home/jovyan/work
COPY my_run_server.sh /home/jovyan

ENV GEN_CERT ${self_signed}
ENV SELF_SIGNED ${self_signed}

ENTRYPOINT ["/bin/bash", "./my_run_server.sh"]
