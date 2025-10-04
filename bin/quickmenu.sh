#!/usr/bin/env bash

SELECTION=$(printf "󰈦 Open PDF\n Open image\n󰃨 Collect Garbage\n󰈆 Exit" | wofi -d)

pdf() {
    FILE=$(ls ~/Downloads/*.pdf | wofi -d)
    zathura $FILE
}

image() {
    FILE=$(ls ~/Pictures | wofi -d)
    satty --filename ~/Pictures/$FILE
}

collect() {
    notify-send nix-collect-garbage "Starting garbage collection"
    nix-collect-garbage -d
    notify-send nix-collect-grabage "Completed garbage collection"
}

case "$SELECTION" in
    "󰈦 Open PDF")
        pdf
        ;;
    " Open image")
        image
        ;;
    "󰃨 Collect Garbage")
        collect
        ;;
esac
