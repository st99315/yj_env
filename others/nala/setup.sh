#!/usr/bin/env bash

abs_dir=$(realpath $(dirname "${BASH_SOURCE[0]}"))
sudo_passwd="$1"

# import install_apt_package
source ${abs_dir}/../../utils.sh

install_apt_package nala ${sudo_passwd}

echo ""
echo "=================="
echo " Nala setup done! "
echo "=================="
echo ""
