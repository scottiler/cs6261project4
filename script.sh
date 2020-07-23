#!/bin/bash
#WORKDIR /src
RUN npm install
RUN npm install -g @angular/cli
# RUN ng build cs6261project4
RUN npm install -g http-server
RUN ng build cs6261project4
WORKDIR /src
RUN npx http-server -p4200
CMD ["supervisord", "-n"]
#
