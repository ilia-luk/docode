#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:14.04

RUN touch /.runonce

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential libevent-dev libncurses-dev autotools-dev && \
  apt-get install -y software-properties-common && \
  apt-get install -y automake byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts
ADD root/.init_scripts/start.sh /root/.init_scripts/start.sh



# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Own initialization scripts.
RUN chmod +rwx ./.init_scripts/*.sh

# Start tmux sessions.
CMD sh .init_scripts/start.sh
