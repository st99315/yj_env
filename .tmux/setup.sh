#!/bin/bash

BASEDIR=$(dirname "$0")
ABSDIR=$(realpath "${BASEDIR}")
DIR="${BASEDIR}/plugins/tpm"

# link .conf to home
rm -f ~/.tmux
ln -sf ${ABSDIR} ~/.tmux
ln -sf ${ABSDIR}/.tmux.conf ~/.tmux.conf

# install plugin manager
git clone --depth 1 https://github.com/tmux-plugins/tpm ${DIR}

# for tmux-yank
sudo apt update
sudo apt install -y xsel
