# Bash Completion
if [ -f `brew --prefix`/etc/bash_completion ] ; then
  . `brew --prefix`/etc/bash_completion
fi

# Hashrocket settings
HASHROCKET_DIR="$HOME/projects"
HASHROCKET_AUTHOR_TMILLER="Tom Miller"

# Personal settings
shopt -s globstar autocd

GIT_EDITOR="$EDITOR"
PATH="$HOME/android-sdk/platform-tools:$HOME/bin:/usr/texbin:$PATH"

# rbenv settings
PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
PATH=".bundle/bin:$PATH"

# tmux settings
alias tmux="TERM=screen-256color-bce tmux -2"

# export ENV vars
export PATH GIT_EDITOR

# shortcuts
alias bundle-init='bundle install --path=.bundle/gems --binstubs=.bundle/bin'
