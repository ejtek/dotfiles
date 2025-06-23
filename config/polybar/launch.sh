#!/usr/bin/env bash

# Terminate any existing polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar with your config and bar name
polybar -c ~/.config/polybar/config.ini mybar &
