
FROM node:11.11.0

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

# Application Code
ADD *.js* $AP/

WORKDIR $AP

RUN npm install
RUN sudo npm install -g @angular/cli
RUN ng build cs6261project4
RUN sudo npm install -g http-server
RUN npx http-server -p4200


CMD ["supervisord", "-n"]
