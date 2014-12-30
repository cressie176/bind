FROM ubuntu:14.04
MAINTAINER bind@stephen-cresswell.net

RUN echo cachebust 29/12/2014

# Configure Ubuntu
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
RUN apt-get update
RUN apt-get -y upgrade
RUN locale-gen en_GB en_GB.UTF-8
RUN ln -sf /bin/bash /bin/sh

# Install basics
RUN apt-get install -y wget curl man dnsutils bc

# Install bind
RUN apt-get install -y bind9 bind9-doc

# Must be mounted
RUN rm /etc/bind/named.conf.options /etc/bind/named.conf.local
RUN ln -s /mnt/bind/named.conf.options /etc/bind/named.conf.options
RUN ln -s /mnt/bind/named.conf.local /etc/bind/named.conf.local
RUN ln -s /mnt/bind/db.acuminous.meh /etc/bind/db.acuminous.meh
RUN ln -s /mnt/bind/db.192 /etc/bind/db.192

CMD /etc/init.d/bind9 start && tail -f /dev/null