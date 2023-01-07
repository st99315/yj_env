#!/bin/bash

BASEDIR=$(dirname "$0")
echo "$BASEDIR"

# set nord-theme to gnome-terminal 
${BASEDIR}/terminal/setup.sh

# # setup tmux
${BASEDIR}/.tmux/setup.sh

echo "Please install pulgins by tpm with <prefix>+I in tmux"
