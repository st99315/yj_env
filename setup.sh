#!/usr/bin/env bash

root_dir=$(realpath $(dirname "${BASH_SOURCE[0]}"))

# import get_password and ansi
source ${root_dir}/utils.sh

echo_ansi "Please provide sudo password" "${ANSI_BOLD}${ANSI_FG_CYAN}"
sudo_passwd=$(get_password)
echo ""

# set nord-theme to gnome-terminal
${root_dir}/terminal/setup.sh ${sudo_passwd}

# setup tmux
${root_dir}/.tmux/setup.sh ${sudo_passwd}

# setup neovim
${root_dir}/nvim/setup.sh ${sudo_passwd}

# setup other utils
${root_dir}/others/fuck/setup.sh ${sudo_passwd}
${root_dir}/others/ulauncher/setup.sh ${sudo_passwd}

echo ""
echo "=================="
echo " All setups done! "
echo "=================="
echo ""
