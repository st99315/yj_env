#!/bin/bash

abs_dir=$(realpath $(dirname "${BASH_SOURCE[0]}"))
clone_dir="${abs_dir}/nord-gnome-terminal"
sudo_passwd="$1"

# import git_clone and echo_ansi
source ${abs_dir}/../utils.sh

# install nord theme
git_clone "https://github.com/arcticicestudio/nord-gnome-terminal.git" ${clone_dir}
${clone_dir}/src/nord.sh

echo ""
echo_ansi ">>> Please change the theme to Nord manually" "${ANSI_BOLD}${ANSI_SLOW_BLINK}${ANSI_FG_YELLOW}"
echo ""
echo "========================"
echo " Nord theme setup done! "
echo "========================"
echo ""
