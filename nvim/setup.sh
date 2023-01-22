#!/usr/bin/env bash

abs_dir=$(realpath $(dirname "${BASH_SOURCE[0]}"))
sudo_passwd="$1"

# import install_deb_package
source ${abs_dir}/../utils.sh

install_snap_package nvim ${sudo_passwd} classic

echo ""
echo "===================="
echo " Neovim setup done! "
echo "===================="
echo ""
