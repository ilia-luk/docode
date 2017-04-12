FROM mhart/alpine-node:7.9

ARG name

ENV HOME /home/server FORCE_COLOR=1 TERM=xterm

COPY ./services/"$name"/package.json ./services/"$name"/npm-shrinkwrap.json $HOME/

WORKDIR $HOME
RUN npm install --no-optional

USER root
COPY ./services/"$name" $HOME/
