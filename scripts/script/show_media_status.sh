#!/bin/sh

STATUS=`mpc status | grep -Eio "playing|paused" | sed 's/^p/P/'`

notify-send "${STATUS}: $(mpc current)"
