#!/bin/sh

update_volume() {
  MUTED=$(osascript -e 'output muted of (get volume settings)')

  if [ "$MUTED" = "true" ]; then
    sketchybar --set "$NAME" drawing=on icon="󰝟"
  else
    sketchybar --set "$NAME" drawing=off
  fi
}

case "$SENDER" in
  "volume_change"|"forced"|"")
    update_volume
    ;;
esac
