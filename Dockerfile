
FROM node:14.0.0

LABEL "maintainer"="piler1@mmy.westga.edu"

USER root

ENV AP /data/app
ENV SCPATH /etc/supervisor/conf.d

RUN apt-get -y update

# The daemons
RUN apt-get -y install supervisor
RUN mkdir -p /var/log/supervisor

# Supervisor Configuration
ADD ./supervisord/conf.d/* $SCPATH/
#COPY ./src

# Application Code
 ADD *.js* $AP/

 WORKDIR $AP
CMD srcript.sh
