#!/usr/bin/env bash

SELECTION=$(printf "󰈦 Open PDF\n Open image\n󰃨 Collect Garbage\n󰸬 Open video\n󰈪 Send File\n󰈆 Exit" | wofi -d)

pdf() {
    FILE=$(find ~/Downloads -type f -iname '*.pdf' | wofi -d)
    zathura "$FILE"
}

image() {
    FILE=$(find ~/Pictures -type f | wofi -d)
    swayimg "$FILE"
}

video() {
    FILE=$(find ~/Videos -type f | wofi -d)
    vlc "$FILE"
}

collect() {
    notify-send nix-collect-garbage "Starting garbage collection"
    nix-collect-garbage -d
    notify-send nix-collect-grabage "Completed garbage collection"
}

send_file() {
    FILE=$(find ~ -type f | wofi -d)
    kitty --class=com.markd.nmtui jocalsend "$FILE"
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
    "󰈪 Send File")
        send_file
        ;;
esac
