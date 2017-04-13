#$HOME/.zshrc

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Add user to hide user from command prompt
export DEFAULT_USER=$USER

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(ubuntu docker docker-compose vundle vi-mode tmux npm node web-search themes colored-man-pages colorize zsh-syntax-highlighting zsh-autosuggestions aws)

# Zsh auto-suggestion style
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# ssh
export SSH_PUB_KEY="~/.ssh/id_rsa.pub"
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Personal Aliases
alias k='tree'
alias ltr='ls -ltr'
alias r='screen -D -R'
alias l='ls -lh'
alias ll='ls -la'

# Add personal bin to $PATH and nodenv.
export PATH="$HOME/.nodenv/bin:$HOME/.nodenv/completions/nodenv.zsh:$HOME/.nodenv/shims:$HOME/bin:$PATH"

# Share commands history
HISTFILE=~/.zsh_history # Set the filename to save history to
HISTSIZE=1000000 # Set your history file to be reasonably huge
HISTTIMEFORMAT="[%F %T %Z]"

# Append, clear, and read history after each command
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# Ignore duplicate commands, and commands that start with spaces
HISTCONTROL='ignoreboth'

# Colorize directory listing
alias ls="ls -ph --color=auto"

# temporary
unset GREP_OPTIONS
alias grep='grep --color=auto'

# Git completion
source $HOME/.scripts/git-prompt.sh
zstyle ':completion:*:*:git:*' script $HOME/.scripts/git-completion.bash
fpath=($HOME/.zsh/functions $fpath)
autoload -Uz compinit && compinit

# Z
source $HOME/.scripts/z/z.sh

# Print all colors
function printAllColors {
  for i in {0..255};do
    │ printf "\x1b[38;5;${i}m${i} "
  done
}
alias pcolors=printAllColors=

# Initialize nodenv and remove first initialization mark
eval "$(nodenv init -)"
if [ -e $HOME/.init_scripts/.runonce ]
then
  # change to use "NODENV_VERSION" global ENV variable
  # eval "$(nodenv install 7.8.0 -)"
  rm -f $HOME/.init_scripts/.runonce
fi
