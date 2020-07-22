#!/bin/bash
supervisord -n
RUN ng build cs6261project4
RUN npx http-server -p4200
#
