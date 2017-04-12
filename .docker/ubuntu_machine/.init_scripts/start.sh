#!/bin/bash

# Change shell to Z-shell
chsh -s /bin/zsh $USER

# Set globals
TMUX_VERSION="$(tmux -V)"
SESSION_01="development"

# Clear rbenv variables before starting tmux
unset RBENV_VERSION
unset RBENV_DIR

cd $HOME

if [ -e $HOME/.init_scripts/.runonce ]
then
  rm -f $HOME/.init_scripts/.runonce
  BLUE='\033[0;34m'
  GREEN='\033[0;32m'
  NC='\033[0m'
  
  printf "${GREEN} Creating working dir: ${BLUE}...${NC}\n"
  mkdir $HOME/devproject

  printf "${GREEN} Initializing scripts: ${BLUE}...${NC}\n"
  # ./.init_scripts/entrypoint.sh

  printf "${GREEN} Pulling from repos: ${BLUE}...${NC}\n"
  # git clone https://github.com/ilia-luk/dotfiles.git

  printf "${GREEN} Starting tmux sessions: ${BLUE}[$SESSION_01]${NC}\n"
  # Run pre commands: 
  cd $HOME/devproject

  # Create Development session and the first window.
  TMUX= tmux new-session -s $SESSION_01 -n editor -d
  # Enter VIM.
  tmux send-keys -t $SESSION_01:1 'vim' C-m
  # Split window and divide main-horizontal.
  tmux split-window -v -t $SESSION_01
  tmux select-layout -t $SESSION_01 main-horizontal
  # Create other window.
  tmux new-window -n console -t $SESSION_01:2
  # Setup a Server window
  tmux new-window -n server -t $SESSION_01:3
  # Setup a MongoDB window
  tmux new-window -n mongo -t $SESSION_01:4
  # Setup a htop window
  tmux new-window -n htop -t $SESSION_01:5
  tmux send-keys -t $SESSION_01:5 'htop' C-m
  # Select main window and pane.
  tmux select-window -t $SESSION_01:1
  tmux select-pane -t $SESSION_01:1.1
fi

# log and attach to session
printf "${GREEN} Tmux running version: ${BLUE}${TMUX_VERSION}${NC}\n"
printf "${GREEN} Attaching to session: ${BLUE}${SESSION_01}${NC}\n"
if [ -z "$TMUX" ]; then
  tmux attach -t $SESSION_01
fi

exit $?

