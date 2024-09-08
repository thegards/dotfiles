#!/bin/sh

ID=$(xinput list | grep -Eio "touchpad\s*id=[0-9]+" | grep -Eio "[0-9]+")

ENABLED=$(xinput list-props ${ID} | grep -Ei "Device Enabled" | cut -f2 -d":")

if [[ ${ENABLED} -eq 1 ]]; then
	xinput disable ${ID}
else
	xinput enable ${ID}
fi
