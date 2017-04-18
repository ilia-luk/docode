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
- [openssh-server](http://)
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

0. Install [Docker](https://www.docker.com/).
1. Run `npm run shrink` in each service (api, cms, web)
2. Run `docker network create -d bridge domusnetwork` to create external docker network
3. Run `docker-compose build`
4. Run `docker-compose up -d`


## Usage

- Run `ssh root@localhost -p 49154` with password `overlord` to attach into the development session (might work with a few sec delay after the 'up' process)
- Run `tmux` to attach into pre-configured tmux session if you sshd into container
- Alternatively run `docker attach dev-ubuntu` to attach into the development tmux session
- Run `prefix(Ctrl-b) d` to deattach from session
- Run `docker-compose down` when finished


## Production https debugging

You should use [docker logs](https://docs.docker.com/engine/reference/commandline/logs/) to see the output of your daemonized containers.

```
$ docker logs nginx
```

You can also checkout the docker-gen generated "default.conf" file using [docker exec](https://docs.docker.com/engine/reference/commandline/exec/)

```
$ docker exec -it nginx-gen cat /etc/nginx/conf.d/default.conf
```


## TODO

- add .vimrc settings
- upgrade to vim 8
- check how to use Terminator in docker container
- add nginx container
- add ssh key to ubuntu container
- add sshd to all node containers
- automate connect to node containers and mongo container through ssh in a tmux session
- enable ssl
- add vim plugins
- add authorized ssh list for tmux pair programming
- get to production ready


## Licence

MIT
