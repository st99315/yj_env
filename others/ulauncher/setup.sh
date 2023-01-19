#!/usr/bin/env bash

abs_dir=$(realpath $(dirname "${BASH_SOURCE[0]}"))
sudo_passwd="$1"

# import install_apt_package
source ${abs_dir}/../../utils.sh

install_apt_package ulauncher ${sudo_passwd} "ppa:agornostal/ulauncher"

function install_plugin() {
    local reppo_url="$1"
    git_clone ${reppo_url} $(${abs_dir}/parser ${reppo_url})
}

install_plugin "https://github.com/fernaper/ulauncher-vscode.git"
install_plugin "https://github.com/manahter/ulauncher-translate.git"
install_plugin "https://github.com/Ulauncher/ulauncher-kill.git"
install_plugin "https://github.com/noam09/ulauncher-remmina.git"
install_plugin "https://github.com/dynobo/ulauncher-list-keywords.git"
install_plugin "https://github.com/friday/ulauncher-clipboard.git"
install_plugin "https://github.com/fisadev/ulauncher-better-file-browser.git"
install_plugin "https://github.com/brpaz/ulauncher-devdocs.git"
install_plugin "https://github.com/ulauncher/ulauncher-timer.git"
install_plugin "https://github.com/beajeanm/ulauncher-windows-switcher.git"

# link to home
rm -rf ~/.config/ulauncher
ln -sf ${abs_dir}/config ~/.config/ulauncher

echo ""
echo "======================="
echo " Ulauncher setup done! "
echo "======================="
echo ""
