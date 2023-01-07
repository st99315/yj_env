#!/usr/bin/env bash

utils_dir=$(realpath $(dirname "${BASH_SOURCE[0]}"))

# import ansi codes
source ${utils_dir}/ansi_codes.sh

function get_password() {
    local passwd

    read -sp "Password: " passwd
    echo "" > /dev/tty

    # return
    echo "${passwd}"
}

function git_clone() {
    local repo_url="$1"
    local clone_dir="$2"

    # install git
    install_apt_package git ${sudo_passwd}

    if [ ! -d "${clone_dir}" ]; then
        git clone --depth 1 ${repo_url} ${clone_dir}
    fi
}

function install_apt_package() {
    local pkg_name="$1"
    local sudo_passwd="$2"

    if [ ! "${sudo_passwd}" ]; then
        echo "Please provide sudo password to install ${pkg_name}" > /dev/tty
        sudo_passwd=$(get_password)
    fi

    # checking package is installed by apt-cache
    if [ "$(apt-cache policy ${pkg_name} | grep Installed | grep none)" ]; then
        echo_ansi "Installing ${pkg_name}" "${ANSI_BOLD}${ANSI_SLOW_BLINK}"
        echo "" > /dev/tty

        echo ${sudo_passwd} | sudo -S apt update
        echo ${sudo_passwd} | sudo -S apt install -y ${pkg_name}
        echo "" > /dev/tty
    fi
}

function install_font() {
    local font_path="$HOME/.local/share/fonts"
    local font_zip_url="$1"
    local name_prefix="$2"
    local zip_file=$(echo "${font_zip_url}" | sed "s#.*/##")

    mkdir -p "${font_path}"
    if [[ ! $(find "${font_path}" -name "${name_prefix}*") ]]; then
        install_apt_package wget ${sudo_passwd}
        install_apt_package unzip ${sudo_passwd}
        install_apt_package fontconfig ${sudo_passwd}

        echo_ansi "Installing ${zip_file}" "${ANSI_BOLD}${ANSI_SLOW_BLINK}"
        echo "" > /dev/tty

        wget "${font_zip_url}"
        unzip -q -o "${zip_file}" -d "${font_path}"
        rm "${zip_file}"
        rm "${font_path}/"*Windows* "${font_path}/"LICENSE* "${font_path}/"*.md
        fc-cache -fv
        echo "" > /dev/tty
    fi
}

function echo_ansi() {
    local msg="$1"
    local style_code="$2"

    echo -e "${style_code}""${msg}""${ANSI_RESET}" > /dev/tty
}
