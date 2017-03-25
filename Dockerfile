#
# Ubuntu Dockerfile
#
# https://github.com/ilia-luk/ubuntu
#

# Pull base image.
FROM ubuntu:16.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y locales build-essential libevent-dev libncurses-dev && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Set locale
ENV LANG en_US.utf8

# Update Tmux.
RUN \
  wget https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz && \
  tar -zxvf tmux-2.3.tar.gz && \
  cd tmux-2.3 && \
  ./configure && make && \
  make install

# We will be running as `root` user.
USER root

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts
ADD root/.init_scripts/start.sh /root/.init_scripts/start.sh

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Configure env variables for tmux
# ENV PATH_01      /opt/ghc/8.0.1/
# ENV PATH_02      /opt/cabal/1.24/
# ENV PATH            $PATH_01/bin:$PATH_02/bin:$PATH

# Own initialization scripts.
RUN chmod +rwx ~/.init_scripts/*.sh

# First init mark.
RUN touch ./.init_scripts/.runonce

CMD sh ./.init_scripts/start.sh
