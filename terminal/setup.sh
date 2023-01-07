#!/bin/bash

BASEDIR=$(dirname "$0")
DIR="${BASEDIR}/nord-gnome-terminal"

git clone https://github.com/arcticicestudio/nord-gnome-terminal.git ${DIR}
${DIR}/src/nord.sh
