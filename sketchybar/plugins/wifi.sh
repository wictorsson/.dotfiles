#!/bin/sh

update_wifi() {
  POWER=$(networksetup -getairportpower en0 2>/dev/null)

  if echo "$POWER" | grep -q "Off"; then
    sketchybar --set "$NAME" drawing=on
  else
    sketchybar --set "$NAME" drawing=off
  fi
}

case "$SENDER" in
  "wifi_change"|"forced"|"")
    update_wifi
    ;;
esac
