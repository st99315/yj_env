#!/usr/bin/env bash

abs_dir=$(realpath $(dirname "${BASH_SOURCE[0]}"))
sudo_passwd="$1"

# import install_deb_package
source ${abs_dir}/../utils.sh

NVIM_PATH=${abs_dir}/nvim.appimage

curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o ${NVIM_PATH}
chmod u+x ${NVIM_PATH}

set -u
echo ${sudo_passwd} | sudo -S update-alternatives --install /usr/bin/vi vi "${NVIM_PATH}" 110
echo ${sudo_passwd} | sudo -S update-alternatives --install /usr/bin/view view "${NVIM_PATH}" 110
echo ${sudo_passwd} | sudo -S update-alternatives --install /usr/bin/vim vim "${NVIM_PATH}" 110
echo ${sudo_passwd} | sudo -S update-alternatives --install /usr/bin/vimdiff vimdiff "${NVIM_PATH}" 110

ln -sf ${abs_dir}/config/nvim ~/.config/nvim

# install python venv
install_apt_package python3-venv ${sudo_passwd}

# install rust and cargo
curl https://sh.rustup.rs -sSf | sh -s -- -y

echo ""
echo "===================="
echo " Neovim setup done! "
echo "===================="
echo ""
