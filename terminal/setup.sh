#!/bin/bash

abs_dir=$(realpath $(dirname "$0"))
clone_dir="${abs_dir}/nord-gnome-terminal"

if [ ! -d "${clone_dir}" ]; then
    git clone https://github.com/arcticicestudio/nord-gnome-terminal.git ${clone_dir}
fi

${clone_dir}/src/nord.sh

echo ""
echo -e "\033[1m>>> Please change the theme to Nord manually\033[0m"
echo ""
echo "========================"
echo " Nord theme setup done! "
echo "========================"
echo ""
