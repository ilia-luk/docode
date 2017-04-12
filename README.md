## Docker compose development environment


This repository contains **Dockerfile** of [Ubuntu](http://www.ubuntu.com/) for [Docker](https://www.docker.com/)'s.

## Base Docker Images

* [ubuntu:16.04](https://registry.hub.docker.com/u/library/ubuntu/)
* [mongo:3.4.2](https://)
* [mhart/alpine-node:7.7](https://)


### Ubuntu contains

#### Shell packages

- [tmux](http://)
- [curl](http://)
- [git](http://)
- [zsh](http://)
- [fontconfig](http://)
- [htop](http://)
- [man](http://)
- [unzip](http://)
- [vim](http://)
- [wget](http://)
- [byobu](http://)
- [tpm](http://)
- [nodenv](http://)
- [node-build](http://)
- [oh-my-zsh](http://)
- [z](http://)

#### Zsh plugins

* [ubuntu](http://), [docker](http://), [docker-compose](http://), [vundle](http://), [vi-mode](http://), [tmux](http://), [npm](http://), [node](http://), [web-search](http://), [themes](http://), [colored-man-pages](http://), [colorize](http://), [colorize](http://), [zsh-syntax-highlighting](http://), [zsh-autosuggestions](http://), [aws](http://),        
#### Fonts for shell

- [Menlo-Powerline.otf](http://)
- [PowerlineSymbols.otf](http://)
- [10-powerline-symbols.conf](http://)

#### Tmux plugins

- [tmux-resurrect](http://)


### Mongo contains

- [netcat-traditional](http://)
- [netcat-openbsd](http://)
 

## Installation

1. Install [Docker](https://www.docker.com/).

2. Run `docker-compose build`

3. Run `docker-compose up -d`

4. Run `docker network create domusnetwork` to create external network


## Usage

- Run `docker attach dev-ubuntu` to attach into the development session
- Run `cd web && nodenv install 7.8.0`
- Run `npm install`
- Run `node server.js` to test mongodb connection
- Run `prefix(Ctrl-b) d` to deattach from session
- Run `docker-compose down` when finished


## TODO

- add .vimrc settings
- move to neovim
- check how to use Terminator in docker container
- add nginx container
- add ssh to ubuntu container
- automate connect to node containers and mongo container through ssh in a tmux window
- enable ssl
- add vim/neovim plugins
- add authorized ssh list for tmux pair programming
- production ready

