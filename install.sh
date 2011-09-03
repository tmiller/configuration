#!/bin/bash

DIR="$( cd "$(dirname "$0" )" && pwd )"

ln -fs "${DIR}/.bashrc" "${HOME}/.bashrc"
ln -fs "${DIR}/.projectrc" "${HOME}/.projectrc"
ln -fs "${DIR}/.tmux.conf" "${HOME}/.tmux.conf"
ln -fs "${DIR}/.gitconfig" "${HOME}/.gitconfig"
ln -fs "${DIR}/.vimrc" "${HOME}/.vimrc"
ln -fs "${DIR}/.cvsignore" "${HOME}/.cvsignore"
ln -fs "${DIR}/.ackrc" "${HOME}/.ackrc"
ln -fs "${DIR}/.gemrc" "${HOME}/.gemrc"

if [ $(uname) == 'Darwin' ]; then
  ln -fs "${DIR}/.bash_profile" "${HOME}/.bash_profile"
  ln -fs "${DIR}/.bashrc.osx" "${HOME}/.bashrc.osx"
elif [ $(uname) == 'Linux' ]; then
  ln -fs "${DIR}/.bashrc.linux" "${HOME}/.bashrc.linux"
  ln -fs "${DIR}/.Xresources" "${HOME}/.Xresources"
fi

[ -d "${HOME}/bin" ] || mkdir -p "${HOME}/bin/"
for binary in ${DIR}/bin/*; do
  cp "${binary}" "${HOME}/bin/"
done

mkdir -p "${HOME}/.vim/bundles"
mkdir -p "${HOME}/.vim/backups"
mkdir -p "${HOME}/.vim/swaps"
mkdir -p "${HOME}/.vim/undo"

exec "${DIR}/bin/vimbundles.sh"
