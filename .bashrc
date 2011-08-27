# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load correct configuration for environment
if [[ $(uname) == 'Darwin' && -f "${HOME}/.bashrc.osx" ]]; then
  source "${HOME}/.bashrc.osx"
elif [[ $(uname) == 'Linux' && -f "${HOME}/.bashrc.linux" ]]; then
 source "${HOME}/.bashrc.linux"
fi

# Personal settings
shopt -s globstar autocd

# Environemnt settings
EDITOR=vim
VISUAL="$EDITOR"
GIT_EDITOR="$EDITOR"
GEM_EDITOR="$EDITOR"
CLICOLOR=1
LS_COLORS='di=31:ln=34:ex=32'

# Setup PATH properly
for dir in /usr/local/bin "${HOME}/local/bin"; do
  case "$PATH" in
    *:"$dir":*) PATH="$(echo "$PATH"|sed -e "s#:$dir##")"
  esac
  PATH="${dir}:${PATH}"
done

export EDITOR VISUAL GIT_EDITOR CLICOLOR LS_COLORS

# shortcuts
alias tmux="TERM=screen-256color tmux -2"
alias ls='ls --color=auto'

[ -f "${HOME}/.projectrc" ] && source "${HOME}/.projectrc"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
