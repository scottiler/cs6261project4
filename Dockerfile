
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
COPY script.sh ./src
RUN echo $(pwd)
#RUN chmod +x ./src/script.sh

# Application Code
 ADD *.js* $AP/

 WORKDIR $AP
 #WORKDIR /src

 RUN npm install
 RUN npm install -g @angular/cli
 RUN npm install -g http-server



 CMD ["supervisord", "-n"]
 WORKDIR /src
 CMD ["script.sh","/bash/bin"]

# docker build -t cs6261project4:testimage  .
# docker run -d -it --name="testcontainer" -p 4200:8080 -v ./app cs6261project4:testimage /bin/bash
# mount | grep data
