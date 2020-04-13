#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

[ x"`uname`" != x"Windows_NT" ] && echo "mintty only works on Windows" && exit 0

ln -snf ${SCRIPT_DIR}/minttyrc             ${HOME}/.minttyrc
