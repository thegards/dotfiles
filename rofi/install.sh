#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR=${XDG_CONFIG_HOME:-${HOME}/.config}/rofi

[ x"`uname`" != x"Linux" ] && echo "rofi only works on linux" && exit 0

[ -d ${CONFIG_DIR} ] || mkdir -p ${CONFIG_DIR}

ln -svnf ${SCRIPT_DIR}/config.rasi         ${CONFIG_DIR}/config.rasi
ln -svnf ${SCRIPT_DIR}/nord.rasi           ${CONFIG_DIR}/nord.rasi
