#!/bin/sh

update_wifi() {
  WIFI_INFO=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>/dev/null)
  SSID=$(echo "$WIFI_INFO" | grep -o "SSID: .*" | cut -d' ' -f2-)
  POWER=$(networksetup -getairportpower en0 2>/dev/null)

  if echo "$POWER" | grep -q "Off"; then
    sketchybar --set "$NAME" drawing=on icon="󰤭"
  elif [ -z "$SSID" ]; then
    sketchybar --set "$NAME" drawing=on icon="󰤭"
  else
    sketchybar --set "$NAME" drawing=off icon="󰤨"
  fi
}

case "$SENDER" in
  "wifi_change"|"forced"|"")
    update_wifi
    ;;
esac
