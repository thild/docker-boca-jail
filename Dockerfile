# VERSION 0.1

FROM ubuntu:xenial

RUN apt-get -y update
RUN apt-get -y install tzdata locales software-properties-common python-software-properties
RUN apt-get -y upgrade
RUN echo "America/Sao_Paulo" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata
RUN locale-gen en_US en_US.UTF-8 pt_BR.UTF-8
RUN locale -a
ENV LANGUAGE=pt_BR.UTF-8
ENV LANG=pt_BR.UTF-8
ENV LC_ALL=pt_BR.UTF-8
RUN locale-gen pt_BR.UTF-8
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

RUN add-apt-repository ppa:brunoribas/ppa-maratona
RUN apt-get -y update
RUN apt-get -y install maratona-boca

COPY init.sh /init.sh

WORKDIR /var/www/boca

# Execute the containers startup script which will start many processes/services
CMD ["/bin/bash", "/init.sh"]



