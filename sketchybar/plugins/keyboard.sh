#!/bin/sh

LAYOUT=$(defaults read com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID 2>/dev/null)

if echo "$LAYOUT" | grep -q "Swedish"; then
  sketchybar --set "$NAME" icon="🇸🇪" icon.color=0xffffffff
else
  sketchybar --set "$NAME" icon=" " icon.color=0x01ffffff
fi
