#!/bin/bash

# Directory containing pictures
PICTURES_DIR=~/Pictures

# Configuration file for hyprpaper
CONFIG_FILE=~/.config/hypr/hyprpaper.conf

# Check if the configuration file exists
if [[ ! -f $CONFIG_FILE ]]; then
  echo "Configuration file not found at $CONFIG_FILE"
  exit 1
fi

# Iterate over each picture in the directory
for PICTURE in "$PICTURES_DIR"/*.{jpg,jpeg,png}; do
  if [[ -f $PICTURE ]]; then
    echo "Setting wallpaper to $PICTURE"

    # Update the wallpaper in hyprpaper.conf
    sed -i "s|wallpaper=.*|wallpaper=$PICTURE|" $CONFIG_FILE

    # Reload the wallpaper (this command may vary based on your system/setup)
    hyprctl reload

    # Wait for a few seconds before changing to the next wallpaper
    sleep 2
  fi
done

