#!/bin/bash

# Check if any player is currently "Playing"
if playerctl -a status 2>/dev/null | grep -q "Playing"; then
    exit 1 # Audio is playing, don't lock/sleep
else
    exit 0 # Safe to proceed
fi
