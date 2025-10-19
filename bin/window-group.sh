#!/usr/bin/env bash

set -euo pipefail

GROUP=""
MODE="class"  # or "group", depending on how you group windows

while getopts "g:m:h" opt; do
  case "$opt" in
    g) GROUP="$OPTARG" ;;
    m) MODE="$OPTARG" ;;
    h)
      echo "Usage: $0 -g GROUP [-m group|class|title]"
      exit 0
      ;;
    *)
      echo "Usage: $0 -g GROUP [-m group|class|title]"
      exit 1
      ;;
  esac
done

if [ -z "$GROUP" ]; then
  echo "You must provide a group name with -g"
  exit 2
fi

command -v hyprctl >/dev/null || { echo "hyprctl not found."; exit 3; }
command -v jq >/dev/null || { echo "jq not found."; exit 3; }
command -v wofi >/dev/null || { echo "wofi not found."; exit 3; }

# Get window info as JSON
WINDOWS_JSON=$(hyprctl clients -j)

# Filter by mode
case "$MODE" in
  group)
    FILTER="select(.group == \"$GROUP\")"
    ;;
  class)
    FILTER="select(.class == \"$GROUP\")"
    ;;
  title)
    FILTER="select(.title | test(\"$GROUP\"))"
    ;;
  *)
    echo "Invalid mode: $MODE"
    exit 4
    ;;
esac

# Build menu list: address::workspace — title
WINDOW_LIST=$(echo "$WINDOWS_JSON" | jq -r "
  .[]
  | $FILTER
  | \"\(.address)::[\(.workspace.name)] \(.class) — \(.title)\"
")

if [ -z "$WINDOW_LIST" ]; then
  echo "No matching windows for '$GROUP' (mode: $MODE)" | wofi --dmenu -p "Hyprland Windows"
  exit 0
fi

CHOICE=$(printf '%s\n' "$WINDOW_LIST" | wofi --dmenu -p "Windows in $GROUP")

[ -z "$CHOICE" ] && exit 0

ADDR=${CHOICE%%::*}

# Focus the chosen window
hyprctl dispatch focuswindow address:"$ADDR"
