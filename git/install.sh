#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -snf ${SCRIPT_DIR}/common.gitconfig     ${HOME}/.gitconfig
