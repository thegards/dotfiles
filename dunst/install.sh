#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR=${XDG_CONFIG_HOME:-${HOME}/.config}/dunst

[ x"`uname`" != x"Linux" ] && echo "dunst only works on linux" && exit 0

[ -d ${CONFIG_DIR} ] || mkdir -p ${CONFIG_DIR}

ln -snf ${SCRIPT_DIR}/dunstrc              ${CONFIG_DIR}/dunstrc
