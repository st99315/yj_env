#!/usr/bin/env bash

abs_dir=$(realpath $(dirname "${BASH_SOURCE[0]}"))
sudo_passwd="$1"

# import install_apt_package
source ${abs_dir}/../utils.sh

# install zsh
install_apt_package zsh ${sudo_passwd}

# install zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# set default shell to current user
sudo usermod -s /bin/zsh $USER

# link .conf to home
ln -sf ${abs_dir}/.zshrc ~/.zshrc

echo ""
echo_ansi ">>> Please logout and login to apply shell" "${ANSI_BOLD}${ANSI_SLOW_BLINK}${ANSI_FG_YELLOW}"
echo ""

echo ""
echo "=================="
echo " zsh setup done! "
echo "=================="
echo ""
