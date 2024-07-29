#!/bin/bash
current_workspace=$(hyprctl workspaces | grep '*' | awk '{print $2}')
next_workspace=$((current_workspace + 1))
hyprctl dispatch movetoworkspace $next_workspace

