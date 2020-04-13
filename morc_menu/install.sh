#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR=${XDG_CONFIG_HOME:-${HOME}/.config}/morc_menu

[ x"`uname`" != x"Linux" ] && echo "morc_menu only works on linux" && exit 0

[ -d ${CONFIG_DIR} ] || mkdir -p ${CONFIG_DIR}

ln -snf ${SCRIPT_DIR}/morc_menu.conf       ${CONFIG_DIR}/morc_menu_v1.conf
