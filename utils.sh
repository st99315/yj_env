#!/bin/bash

function get_password() {
    local msg="$1"
    local passwd

    echo "${msg}" > /dev/tty
    read -sp "Password: " passwd
    echo "" > /dev/tty
    echo "" > /dev/tty

    echo "${passwd}"
}

function install_apt_package() {
    local sudo_passwd="$1"
    local pkg_name="$2"

    if [ ! "$(dpkg -l | grep ${pkg_name})" ]; then
        echo ${sudo_passwd} | sudo -S apt update
        echo ${sudo_passwd} | sudo -S apt install -y ${pkg_name}
        echo "" > /dev/tty
    fi
}
