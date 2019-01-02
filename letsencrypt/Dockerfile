FROM ubuntu:bionic

USER root
# RUN /bin/bash -c 'apt-get -y update;'
RUN /bin/bash -c 'apt-get -y update; \
    apt-get install -y software-properties-common; \
    add-apt-repository -y universe; \
    add-apt-repository -y ppa:certbot/certbot; \
    apt-get -y update; \
    apt-get -y install certbot; \
    apt-get -y install python3-certbot-dns-digitalocean'


CMD ["certbot", "certonly", "--dns-digitalocean","--dns-digitalocean-credentials", "/root/secrets/DOtoken.ini"]