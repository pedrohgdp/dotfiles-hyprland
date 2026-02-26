#!/bin/bash

STATE_FILE="/tmp/waybar_power_state"
OPTIONS=("⏻" "" "󰤄" "󰍃")
CMDS=("poweroff" "reboot" "systemctl suspend" "hyprctl dispatch exit")

[ ! -f "$STATE_FILE" ] && echo 0 > "$STATE_FILE"
STATE=$(cat "$STATE_FILE")

case "$1" in
  next)
    STATE=$(( (STATE+1) % 4 ))
    echo $STATE > "$STATE_FILE"
    ;;
  prev)
    STATE=$(( (STATE-1+4) % 4 ))
    echo $STATE > "$STATE_FILE"
    ;;
  run)
    eval ${CMDS[$STATE]}
    ;;
esac

echo ${OPTIONS[$STATE]}