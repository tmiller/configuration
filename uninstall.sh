#!/bin/bash

rm "${HOME}/.bashrc"
rm "${HOME}/.projectrc"
rm "${HOME}/.tmux.conf"
rm "${HOME}/.vimrc"
rm "${HOME}/.cvsignore"
rm "${HOME}/.ackrc"
rm "${HOME}/.gemrc"


if [ $(uname) == 'Darwin' ]; then
  rm "${HOME}/.bash_profile"
  rm "${HOME}/.osx.bashrc"
elif [ $(uname) == 'Linux' ]; then
  rm "${HOME}/.linux.bashrc"
  rm "${HOME}/.Xresources"
fi


if [ -d "${HOME}/bin" ]; then
  dir=$(pwd)
  for binary in ${dir}/bin/*; do
    rm "${HOME}/bin/$( basename $binary )"
  done
fi

rm -rf "${HOME}/.vim/bundles"
rm -rf "${HOME}/.vim/backups"
rm -rf "${HOME}/.vim/swaps"
rm -rf "${HOME}/.vim/undo"
