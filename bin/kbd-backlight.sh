#!/usr/bin/env bash
# Designed for Framework 13 laptop keyboard backlight, may need modification for other models

DEVICE="/sys/class/leds/framework_laptop::kbd_backlight"

brightness=$(cat "$DEVICE/brightness")

if [ "$brightness" -eq 0 ]; then
    icon=""
else
    icon=""
fi

echo "{\"text\":\"$icon\",\"tooltip\":\"Keyboard backlight: $brightness\"}"
