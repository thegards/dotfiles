#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cpp -P  ${SCRIPT_DIR}/Xresources         > ${HOME}/.Xresources
