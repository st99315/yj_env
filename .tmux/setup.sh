#!/bin/bash

abs_dir=$(realpath $(dirname "$0"))
clone_dir="${abs_dir}/plugins/tpm"
sudo_passwd="$1"

source ${abs_dir}/../utils.sh

# link .conf to home
rm -f ~/.tmux
ln -sf ${abs_dir} ~/.tmux
ln -sf ${abs_dir}/.tmux.conf ~/.tmux.conf

# install plugin manager
if [ ! -d "${clone_dir}" ]; then
    git clone --depth 1 https://github.com/tmux-plugins/tpm ${clone_dir}
fi

${clone_dir}/bin/clean_plugins
${clone_dir}/bin/install_plugins
${clone_dir}/bin/update_plugins all

# for tmux-yank
install_apt_pakage ${sudo_passwd} xsel

echo ""
echo "=================="
echo " tmux setup done! "
echo "=================="
echo ""
