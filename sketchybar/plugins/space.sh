#!/bin/sh

if [ "$SELECTED" = "true" ]; then
  sketchybar --set "$NAME" icon.color=0xffffffff
else
  sketchybar --set "$NAME" icon.color=0x1fffffff
fi
