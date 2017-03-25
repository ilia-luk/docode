#!/bin/bash

TMUX_VERSION="$(tmux -V)"
INITIAL_SESSION='development'

cd ~

if [ -e ./.init_scripts/.runonce ]
then
  rm -f ./.init_scripts/.runonce
  BLUE='\033[0;34m'
  GREEN='\033[0;32m'
  NC='\033[0m'

  printf "${GREEN} Initializing scripts: ${BLUE}...${NC}\n"
  # ./.init_scripts/entrypoint.sh

  printf "${GREEN} Pulling from repos: ${BLUE}...${NC}\n"
  # git clone https://github.com/ilia-luk/dotfiles.git

  printf "${GREEN} Starting tmux sessions${NC}\n"
  tmux new -d -s monitoring
  tmux new -d -s poc_1
  tmux new -d -s poc_2
  tmux new -d -s poc_3
  tmux new -d -s development
fi

# log and attach to session
printf "${GREEN} Tmux running version: ${BLUE}${TMUX_VERSION}${NC}\n"
printf "${GREEN} Attaching to session: ${BLUE}${INITIAL_SESSION}${NC}\n"
tmux attach -t development

exit $?