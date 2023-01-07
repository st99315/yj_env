#!/usr/bin/env bash

abs_dir=$(realpath $(dirname "${BASH_SOURCE[0]}"))
sudo_passwd="$1"

# import install_apt_package
source ${abs_dir}/../utils.sh

install_apt_package python3-pip ${sudo_passwd}

pip3 install thefuck --user

append_string ~/.zshrc 'eval $(thefuck --alias)'
append_string ~/.bashrc 'eval $(thefuck --alias)'

echo ""
echo "========================="
echo " Funny utils setup done! "
echo "========================="
echo ""
