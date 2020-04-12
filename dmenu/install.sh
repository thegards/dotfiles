#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

[ x"`uname`" != x"Linux" ] && echo "dmenu only works on linux" && exit 0

ln -snf ${SCRIPT_DIR}/dmenurc        ${HOME}/.dmenurc
