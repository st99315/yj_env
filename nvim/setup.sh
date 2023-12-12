#!/usr/bin/env bash

abs_dir=$(realpath $(dirname "${BASH_SOURCE[0]}"))
sudo_passwd="$1"

# import install_deb_package
source ${abs_dir}/../utils.sh

NVIM_PATH=${abs_dir}/nvim.appimage

curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o ${NVIM_PATH}
chmod u+x ${NVIM_PATH}

echo ${sudo_passwd} | sudo -S update-alternatives --install /usr/bin/vi vi "${NVIM_PATH}" 110
echo ${sudo_passwd} | sudo -S update-alternatives --install /usr/bin/view view "${NVIM_PATH}" 110
echo ${sudo_passwd} | sudo -S update-alternatives --install /usr/bin/vim vim "${NVIM_PATH}" 110
echo ${sudo_passwd} | sudo -S update-alternatives --install /usr/bin/vimdiff vimdiff "${NVIM_PATH}" 110

# Link config directory to nvim path
# -n: avoid create the symbol link in directory
ln -sfn ${abs_dir}/config/nvim/ ~/.config/nvim

# install python venv
install_apt_package python3-venv ${sudo_passwd}

# install pynvim
pip3 install --user pynvim

# install rust and cargo
curl https://sh.rustup.rs -sSf | sh -s -- -y

# install rg (ripgrep)
install_apt_package ripgrep ${sudo_passwd}

# install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
echo ${sudo_passwd} | sudo -S install lazygit /usr/local/bin
rm -f lazygit.tar.gz lazygit

# install fzf

echo ""
echo "===================="
echo " Neovim setup done! "
echo "===================="
echo ""
