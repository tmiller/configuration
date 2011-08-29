#!/bin/bash

dir=$(pwd)

ln -fs "${dir}/.bashrc" "${HOME}/.bashrc"
ln -fs "${dir}/.projectrc" "${HOME}/.projectrc"
ln -fs "${dir}/.tmux.conf" "${HOME}/.tmux.conf"
ln -fs "${dir}/.gitconfig" "${HOME}/.gitconfig"
ln -fs "${dir}/.vimrc" "${HOME}/.vimrc"
ln -fs "${dir}/.cvsignore" "${HOME}/.cvsignore"
ln -fs "${dir}/.ackrc" "${HOME}/.ackrc"
ln -fs "${dir}/.gemrc" "${HOME}/.gemrc"

if [ $(uname) == 'Darwin' ]; then
  ln -fs "${dir}/.bash_profile" "${HOME}/.bash_profile"
  ln -fs "${dir}/.osx.bashrc" "${HOME}/.osx.bashrc"
elif [ $(uname) == 'Linux' ]; then
  ln -fs "${dir}/.linux.bashrc" "${HOME}/.linux.bashrc"
  ln -fs "${dir}/.Xresources" "${HOME}/.Xresources"
fi

[ -d "${HOME}/bin" ] || mkdir -p "${HOME}/bin/"
for binary in ${dir}/bin/*; do
  cp "${binary}" "${HOME}/bin/"
done

mdkir -p "${HOME}/.vim/{bundles,backups,swaps,undo}"
exec "${dir}/bin/vimbundles.sh"
