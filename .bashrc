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
TERM=xterm-256color

# Setup PATH properly
for dir in /usr/local/bin /usr/local/Cellar/python "${HOME}/bin"; do
  case "$PATH" in
    *:"$dir":*) PATH="$(echo "$PATH"|sed -e "s#:$dir##")"
  esac
  PATH="${dir}:${PATH}"
done

#[ -z "$PS1" ] || stty -ixon
[ -z "$PS1" ] || export PS1="\[\033[0;32m\]\u\[\033[00m\]:\[\033[0;34m\]\w\[\033[00m\]\$(git_prompt_info '(%b)')$ "

export EDITOR VISUAL GIT_EDITOR CLICOLOR LS_COLORS TERM

# shortcuts
alias gc='git commit -v'
alias gca='git commit -a -v'
alias gst='git status'
alias gpr='git pull --rebase'

[[ -s "${HOME}/.projectrc" ]] && source "${HOME}/.projectrc"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
