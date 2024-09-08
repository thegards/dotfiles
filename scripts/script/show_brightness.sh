#!/bin/sh

pgrep volnoti || volnoti

LCD_DATA=$(acpi -c | grep LCD | cut -d":" -f 2)

MAX_LEVEL=$(echo $LCD_DATA | cut -f 4 -d " ")
CUR_LEVEL=$((${MAX_LEVEL} - $(echo $LCD_DATA | cut -f 2 -d " ")))

volnoti-show -s ~/scripts/brightness.svg  $((100 *${CUR_LEVEL} / ${MAX_LEVEL}))

