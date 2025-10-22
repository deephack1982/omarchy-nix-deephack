#!/usr/bin/env bash

SELECTION=$(printf "󰈦 Open PDF\n Open image\n󰃨 Collect Garbage\n󰸬 Open video\n󰈆 Exit" | wofi -d)

pdf() {
    FILE=$(find ~/Downloads -type f -iname '*.pdf' | wofi -d)
    zathura ${FILE@Q}
}

image() {
    FILE=$(find ~/Pictures -type f | wofi -d)
    swayimg ${FILE@Q}
}

video() {
    FILE=$(find ~/Videos -type f | wofi -d)
    vlc ${FILE@Q}
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
    "󰸬 Open video")
        video
        ;;
    "󰃨 Collect Garbage")
        collect
        ;;
esac
