#!/usr/bin/env bash

if pgrep -x wf-recorder >/dev/null; then
    echo '{"text":" REC","class":"recording","tooltip":"wf-recorder is running"}'
else
    echo '{"text":"","class":"stopped","tooltip":"wf-recorder is not running"}'
fi
