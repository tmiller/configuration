#!/bin/sh
mkdir -p ~/.vim/bundles
cd ~/.vim/bundles

get_bundle() {
  (
  if [ -d "$2" ]; then
    echo "Updating $1's $2"
    cd "$2"
    git pull --rebase
  else
    git clone "git://github.com/$1/$2.git"
  fi
  )
}

get_bundle adamlowe vim-slurper
get_bundle godlygeek tabular
get_bundle mileszs ack.vim
get_bundle pangloss vim-javascript
get_bundle vim-ruby vim-ruby
get_bundle tpope vim-rails
get_bundle tpope vim-rake
get_bundle tpope vim-cucumber
get_bundle tpope vim-haml
get_bundle tpope vim-markdown
get_bundle tpope vim-pathogen
get_bundle tpope vim-abolish
get_bundle tpope vim-endwise
get_bundle tpope vim-git
get_bundle tpope vim-rake
get_bundle tpope vim-ragtag
get_bundle tpope vim-repeat
get_bundle tpope vim-surround
get_bundle tpope vim-unimpaired
get_bundle tpope vim-fugitive
get_bundle gregsexton gitv
get_bundle jgdavey vim-blockle
get_bundle tmiller wombat256.vim

vim -c 'call pathogen#helptags()|q'
