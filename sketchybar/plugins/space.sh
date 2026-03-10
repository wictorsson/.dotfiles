#!/bin/sh

if [ "$SELECTED" = "true" ]; then
  sketchybar --set "$NAME" icon.color=0xff7f9e7f
else
  sketchybar --set "$NAME" icon.color=0x1fffffff
fi
