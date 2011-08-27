#!/bin/bash

dir=$(pwd)

ln -fs "${dir}/.bashrc" "${HOME}/.bashrc"
ln -fs "${dir}/.projectrc" "${HOME}/.projectrc"
ln -fs "${dir}/.tmux.conf" "${HOME}/.tmux.conf"
ln -fs "${dir}/.gitconfig" "${HOME}/.gitconfig"
ln -fs "${dir}/.vimrc" "${HOME}/.vimrc"
ln -fs "${dir}/.cvsignore" "${HOME}/.cvsignore"

if [ $(uname) == 'Darwin' ]; then
  ln -fs "${dir}/.osx.bashrc" "${HOME}/.osx.bashrc"
elif [ $(uname) == 'Linux' ]; then
  ln -fs "${dir}/.linux.bashrc" "${HOME}/.linux.bashrc"
  ln -fs "${dir}/.Xresources" "${HOME}/.Xresources"
fi

[ -d "${HOME}/local/bin" ] && mkdir -p "${HOME}/local/bin"
for binary in ${dir}/bin/*; do
  ln -fs "${binary}" "${HOME}/local/bin/"
done
