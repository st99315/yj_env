#!/usr/bin/env bash

abs_dir=$(realpath $(dirname "${BASH_SOURCE[0]}"))
clone_dir="${abs_dir}/nord-gnome-terminal"
sudo_passwd="$1"

# import install_deb_package
source ${abs_dir}/../utils.sh

install_deb_package "https://github.com/neovim/neovim/releases/download/v0.8.2/nvim-linux64.deb" "neovim" ${sudo_passwd}

echo ""
echo "===================="
echo " Neovim setup done! "
echo "===================="
echo ""
