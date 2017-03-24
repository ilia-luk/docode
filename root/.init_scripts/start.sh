#!/bin/bash

cd ~
if [[ -e /.runonce ]]; then
  rm -f /.runonce
  BLUE='\033[0;34m'
  GREEN='\033[0;32m'
  NC='\033[0m'

  printf "${GREEN}Initializing tmux sciprt${BLUE} Pulling from repo${NC}\n"
  git clone https://github.com/tmux/tmux.git
  cd tmux
  sh autogen.sh
  ./configure && make
  cd ~
fi

# Attaching new session
echo "Attaching to development session"
tmux new -s development

exit $?