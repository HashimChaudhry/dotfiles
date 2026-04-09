#!/usr/bin/env bash

#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

if command -v xrandr >/dev/null 2>&1; then
    xrandr --query | grep " connected" | while read -r line; do
        m=$(echo "$line" | cut -d' ' -f1)
        if echo "$line" | grep -q "primary"; then
            MONITOR=$m polybar --reload main &
        else
            MONITOR=$m polybar --reload secondary &
        fi
    done
else
    polybar --reload main &
fi

echo "Bars launched..."
