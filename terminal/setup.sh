#!/bin/bash

abs_dir=$(realpath $(dirname "$0"))
clone_dir="${abs_dir}/nord-gnome-terminal"

if [ ! -d "${clone_dir}" ]; then
    git clone https://github.com/arcticicestudio/nord-gnome-terminal.git ${clone_dir}
fi

${clone_dir}/src/nord.sh

echo ""
echo "=========================================="
echo " Nord theme of gnome-terminal setup done! "
echo " Please change the theme to Nord manually "
echo "=========================================="
echo ""
