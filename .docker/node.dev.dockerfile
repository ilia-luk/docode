FROM mhart/alpine-node:7.7

ARG name

RUN useradd --user-group --create-home --shell /bin/false server

ENV HOME=/home/server FORCE_COLOR=1 TERM=xterm

COPY ./services/"$name"/package.json ./services/"$name"/npm-shrinkwrap.json $HOME/
RUN chown -R operator:operator $HOME/*

USER operator
WORKDIR $HOME
RUN npm install --no-optional

USER root
COPY ./services/"$name" $HOME/
RUN chown -R operator:operator $HOME/*
USER operator