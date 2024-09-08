#!/bin/sh

# Start volnoti if needed
pgrep volnoti >/dev/null || volnoti

if [[ "`pamixer --get-mute`" == "true" ]]; then
	volnoti-show -m -n
else
	volnoti-show $(pamixer --get-volume)
fi
