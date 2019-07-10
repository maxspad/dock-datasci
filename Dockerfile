FROM jupyter/datascience-notebook

USER root
RUN apt-get update && apt-get install -y git perl openssh-client

USER jovyan
RUN pip install ipympl
RUN git config --global user.email "maxspad@umich.edu" && git config --global user.name "Maxwell Spadafore"
# RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
# RUN jupyter labextension install jupyter-matplotlib
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-242.0.0-linux-x86_64.tar.gz && \
tar zxvf google-cloud-sdk-242.0.0-linux-x86_64.tar.gz google-cloud-sdk && \
./google-cloud-sdk/install.sh --usage-reporting false --quiet
RUN pip install google-api-python-client google-cloud-language wordcloud nltk
# RUN jupyter serverextension enable jupyterlab_sql --py --sys-prefix
RUN jupyter labextension install @jupyterlab/toc


