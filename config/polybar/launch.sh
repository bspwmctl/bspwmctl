#!/usr/bin/env sh

# Terminate already running bar instances
pkill -x polybar

# Wait until the processes have been shut down
while pgrep -u "$(id -u)" -x polybar > /dev/null; do sleep 0.2; done

# Left bars
polybar log -c ~/.config/polybar/current.ini &
polybar secondary -c ~/.config/polybar/current.ini &
polybar terciary -c ~/.config/polybar/current.ini &
polybar quaternary -c ~/.config/polybar/current.ini &

# Right bars
polybar top -c ~/.config/polybar/current.ini &
polybar primary -c ~/.config/polybar/current.ini &

# Center bar
polybar primary -c ~/.config/polybar/workspace.ini &
