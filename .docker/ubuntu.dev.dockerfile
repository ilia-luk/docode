#
# Ubuntu Dockerfile
#
# https://github.com/ilia-luk/ubuntu
#

# Pull base image
FROM ubuntu:16.04

# Set environment variables
ENV HOME /root

ENV TERM xterm-256color
ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV ZSH_CUSTOM $HOME/.oh-my-zsh/custom
ENV NODENV_VERSION 7.8.0

# Install from apt-get
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && apt-get upgrade -y && \
  apt-get install -y build-essential libevent-dev libncurses-dev && \
  apt-get install -y software-properties-common locales && \
  apt-get install -y byobu curl git zsh fontconfig htop man unzip vim wget openssh-server && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Install from Git
RUN \
  git clone http://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm && \
  git clone https://github.com/nodenv/nodenv.git $HOME/.nodenv && \
  git clone https://github.com/nodenv/node-build.git $HOME/.nodenv/plugins/node-build && \
  git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh && \
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting && \
  git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions && \
  git clone git://github.com/rupa/z.git $HOME/.scripts/z

# Enable SSHd
RUN mkdir /var/run/sshd
RUN echo 'root:overlord' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22

RUN /usr/sbin/sshd

# Generate locale
RUN locale-gen en_US.UTF-8

# Add files
ADD .docker/ubuntu_machine/.tmux.conf $HOME/.tmux.conf
ADD .docker/ubuntu_machine/.bashrc $HOME/.bashrc
ADD .docker/ubuntu_machine/.zshrc $HOME/.zshrc
ADD .docker/ubuntu_machine/.gitconfig $HOME/.gitconfig
ADD .docker/ubuntu_machine/.scripts/git-completion.zsh $HOME/.zsh/functions/_git
ADD .docker/ubuntu_machine/.vimrc $HOME/.vimrc
ADD .docker/ubuntu_machine/.scripts $HOME/.scripts
ADD .docker/ubuntu_machine/.init_scripts/start.sh $HOME/.init_scripts/start.sh

# Update Tmux
RUN \
  wget https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz && \
  tar -zxvf tmux-2.3.tar.gz && \
  cd tmux-2.3 && \
  ./configure && make && \
  make install

# Install Powerline fonts
RUN \
  cd $HOME && \
  wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf && \
  wget https://gist.github.com/qrush/1595572/raw/417a3fa36e35ca91d6d23ac961071094c26e5fad/Menlo-Powerline.otf && \
  wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf && \
  mkdir .fonts && \
  mkdir -p .config/fontconfig/conf.d && \
  mv Menlo-Powerline.otf $HOME/.fonts/ && \
  mv PowerlineSymbols.otf $HOME/.fonts/ && \
  fc-cache -vf $HOME/.fonts/ && \
  mv 10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d/

# We will be running as `root` user
USER root

# Define working directory
WORKDIR $HOME 

# install nodenv
RUN \
  cd $HOME/.nodenv && \
  src/configure && \
  make -C src

# Own initialization scripts
RUN chmod +rwx $HOME/.init_scripts/*.sh

# First init mark
RUN touch $HOME/.init_scripts/.runonce

# Start cmd
CMD sh $HOME/.init_scripts/start.sh
