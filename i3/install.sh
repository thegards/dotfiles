#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR=${XDG_CONFIG_HOME:-${HOME}/.config}/i3

[ x"`uname`" != x"Linux" ] && echo "i3 only works on linux" && exit 0

[ -d ${CONFIG_DIR} ] || mkdir -p ${CONFIG_DIR}

ln -snf ${SCRIPT_DIR}/i3-config            ${CONFIG_DIR}/config
