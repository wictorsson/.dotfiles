#!/bin/sh

CPU=$(top -l 1 -n 0 | grep "CPU usage" | awk '{print int($3)}')

if [ "$CPU" -lt 17 ]; then
  BAR="▁"
  COLOR="0xff00ff00"
elif [ "$CPU" -lt 34 ]; then
  BAR="▂"
  COLOR="0xff44ff00"
elif [ "$CPU" -lt 50 ]; then
  BAR="▃"
  COLOR="0xff88ff00"
elif [ "$CPU" -lt 67 ]; then
  BAR="▅"
  COLOR="0xffffff00"
elif [ "$CPU" -lt 84 ]; then
  BAR="▆"
  COLOR="0xffff8800"
else
  BAR="▇"
  COLOR="0xffff0000"
fi

sketchybar --set "$NAME" icon="$BAR" icon.color="$COLOR"
