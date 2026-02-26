#!/bin/bash

MAX_LENGTH=40
SCROLL_SPEED=0.2

STATUS=$(playerctl -p spotify status 2>/dev/null)

if [[ "$STATUS" != "Playing" && "$STATUS" != "Paused" ]]; then
    echo "  Music not found"
    exit 0
fi

ARTIST=$(playerctl -p spotify metadata artist)
TITLE=$(playerctl -p spotify metadata title)

TEXT="  $ARTIST - $TITLE"

LENGTH=${#TEXT}

if [ $LENGTH -le $MAX_LENGTH ]; then
    echo "$TEXT"
else
    TEXT="$TEXT   •   "
    while true; do
        for (( i=0; i<${#TEXT}; i++ )); do
            echo "${TEXT:$i:$MAX_LENGTH}"
            sleep $SCROLL_SPEED
        done
    done
fi
