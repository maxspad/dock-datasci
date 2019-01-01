FROM python:3-slim-stretch

USER root
RUN /bin/bash -c 'apt-get -y update;'
# RUN /bin/bash -c 'apt-get -y update; \
#     add-apt-repository -y ppa:certbot/certbot; \
#     apt-get -y update; \
#     apt-get -y install certbot'

# Copy in our shell script
COPY gencerts.sh ~/gencerts.sh

# What's next?? 
# We need to find out if we're running on the server or not
# If not, self-sign the certificate
# If yes, get it 

