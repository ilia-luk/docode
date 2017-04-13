FROM mhart/alpine-node:7.9

ARG name

ENV HOME /root/service
ENV FORCE_COLOR 1 
ENV TERM xterm

COPY ./services/"$name"/package.json ./services/"$name"/npm-shrinkwrap.json $HOME/

WORKDIR $HOME
RUN npm install

USER root

COPY ./services/"$name" $HOME/
