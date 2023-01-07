#!/bin/bash

abs_dir=$(realpath $(dirname "${BASH_SOURCE[0]}"))
clone_dir="${abs_dir}/plugins/tpm"
sudo_passwd="$1"

# import git_clone and install_apt_package
source ${abs_dir}/../utils.sh

# link .conf to home
rm -f ~/.tmux
ln -sf ${abs_dir} ~/.tmux
ln -sf ${abs_dir}/.tmux.conf ~/.tmux.conf

# install plugin manager
git_clone "https://github.com/tmux-plugins/tpm.git" ${clone_dir}

# update plugins
${clone_dir}/bin/clean_plugins
${clone_dir}/bin/install_plugins
${clone_dir}/bin/update_plugins all
echo ""

# for tmux-yank
install_apt_package xsel ${sudo_passwd}

echo ""
echo "=================="
echo " tmux setup done! "
echo "=================="
echo ""
