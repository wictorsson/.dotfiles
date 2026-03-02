#!/bin/sh

VOLUME=$(osascript -e 'output volume of (get volume settings)')

if [ "$VOLUME" -eq 0 ]; then
  sketchybar --set "$NAME" icon="󰝟" icon.color=0xffffffff
else
  sketchybar --set "$NAME" icon.color=0x01ffffff
fi
