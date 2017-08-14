# VERSION 0.1

FROM decomp/boca-base

RUN apt-get -y install quota accountsservice --no-install-recommends --allow-unauthenticated
RUN apt-get -y clean

COPY startup.sh /startup.sh

WORKDIR /var/www/boca

# Execute the containers startup script which will start many processes/services
CMD ["/bin/bash", "/startup.sh"]
