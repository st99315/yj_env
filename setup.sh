#!/bin/bash

# base_dir=$(dirname "$0")
abs_dir=$(realpath $(dirname "$0"))
source ${abs_dir}/utils.sh

msg="Please provide sudo password"
sudo_passwd=$(get_password "${msg}")

# set nord-theme to gnome-terminal
${abs_dir}/terminal/setup.sh

# # setup tmux
${abs_dir}/.tmux/setup.sh ${sudo_passwd}

echo ""
echo "=================="
echo " All setups done! "
echo "=================="
echo ""
