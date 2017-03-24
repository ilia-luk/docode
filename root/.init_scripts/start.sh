#!/bin/bash

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

printf "${GREEN}Initializing tmux sciprt${BLUE} Pulling from repo${NC}\n"
cd ~
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make
cd ~
printf "${GREEN}Starting new tmux development session${NC}\n"
tmux new -s development
