# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PATH helper functions
remove_from_path() {
  case "$PATH" in
    *:"$1":*) PATH="$(echo "$PATH"|sed -e "s#:${1}##g")"
  esac
  export PATH
}

prepend_path() {
  local args arg dir

  # reverse the order of the arguments to preserve the order passed in
  for arg in $@; do
    args="$arg $args"
  done

  for dir in $args; do
    remove_from_path "$dir"
    PATH="${dir}:${PATH}"
  done
  export PATH
}

append_path() {
  local dir

  for dir in $@; do
    remove_from_path "$dir"
    PATH="${PATH}:${dir}"
  done
  export PATH
}

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

prepend_path "${HOME}/bin" /usr/local/bin
append_path "${HOME}/.sm/bin" "${HOME}/.sm/pkg/active/bin" "${HOME}/.sm/pkg/active/sbin" /usr/local/Cellar/python

#[ -z "$PS1" ] || stty -ixon
[ -z "$PS1" ] || export PS1="\[\033[34m\]\u\[\033[00m\]:\[\033[36m\]\w\[\033[00m\]\$(git_prompt_info '(%b)')$ "

export EDITOR VISUAL GIT_EDITOR CLICOLOR LS_COLORS TERM

# shortcuts
alias gc='git commit -v'
alias gca='git commit -a -v'
alias gst='git status'
alias gpr='git pull --rebase'

# Load correct configuration for environment
if [[ $(uname) == 'Darwin' && -f "${HOME}/.bashrc.osx" ]]; then
  source "${HOME}/.bashrc.osx"
elif [[ $(uname) == 'Linux' && -f "${HOME}/.bashrc.linux" ]]; then
 source "${HOME}/.bashrc.linux"
fi

# Load project configuration
[[ -s "${HOME}/.projectrc" ]] && source "${HOME}/.projectrc"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
