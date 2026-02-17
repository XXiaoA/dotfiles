#!/bin/bash

# Get current active opacity to restore it accurately
ORIG_OPACITY=$(hyprctl getoption decoration:active_opacity -j | jq -r '.float')

# Focus the next monitor
hyprctl dispatch focusmonitor +1

# Warp the cursor to the center of the new monitor
# (This ensures the "blink" happens where your eyes are going)
NEW_MON=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')
hyprctl dispatch movecursortomonitor "$NEW_MON"

# The Blink Effect: Rapidly cycle opacity
# We set it to 0.2 (dim) then back to original (bright)
hyprctl keyword decoration:active_opacity 0.2
sleep 0.08
hyprctl keyword decoration:active_opacity "$ORIG_OPACITY"
