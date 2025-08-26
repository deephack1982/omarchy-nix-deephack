#!/usr/bin/env bash

if [ "$1" = "click" ]; then
    if pgrep -x wf-recorder >/dev/null; then
        pkill -INT wf-recorder
    else
        wf-recorder -a -c h264_vaapi -d /dev/dri/renderD128 -f "$HOME/$(date +%Y-%m-%d-%H:%M:%S).mp4" &
    fi
    exit 0
fi

if pgrep -x wf-recorder >/dev/null; then
    echo '{"text":" REC","class":"recording","tooltip":"wf-recorder is running (click to stop)"}'
else
    echo '{"text":"","class":"stopped","tooltip":"wf-recorder is not running (click to start)"}'
fi
