#!/bin/bash

get_volume() {
  pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1 | tr -d '%'
}

set_volume() {
  pactl set-sink-volume @DEFAULT_SINK@ "$1%"
}

case "$1" in
  up)
    VOL=$(get_volume)
    NEW=$((VOL + 5))
    [ "$NEW" -gt 100 ] && NEW=100
    set_volume $NEW
    ;;
  down)
    VOL=$(get_volume)
    NEW=$((VOL - 5))
    [ "$NEW" -lt 0 ] && NEW=0
    set_volume $NEW
    ;;
esac

VOL=$(get_volume)

TOTAL=10
FILLED=$((VOL * TOTAL / 100))
EMPTY=$((TOTAL - FILLED))

BAR=""
for ((i=0;i<FILLED;i++)); do BAR+="●"; done
for ((i=0;i<EMPTY;i++)); do BAR+="○"; done

echo "$BAR"