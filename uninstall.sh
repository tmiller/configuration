#!/bin/bash

rm "${HOME}/.bashrc"
rm "${HOME}/.projectrc"
rm "${HOME}/.tmux.conf"
rm "${HOME}/.gitconfig"
rm "${HOME}/.vimrc"
rm "${HOME}/.cvsignore"
rm "${HOME}/.ackrc"
rm "${HOME}/.gemrc"


if [ $(uname) == 'Darwin' ]; then
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

rm -rf ${HOME}/.vim/{bundles,backups,swaps,undo}
