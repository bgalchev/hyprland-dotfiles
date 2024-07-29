#!/bin/bash

# Script to update Arch Linux system

# Function to check if the script is run as root
check_root() {
    if [[ "$EUID" -ne 0 ]]; then
        echo "Please run this script as root."
        exit 1
    fi
}

# Function to update the package database and system
update_system() {
    echo "Updating package database..."
    pacman -Sy

    echo "Upgrading the system..."
    pacman -Su

    echo "Cleaning up unnecessary files..."
    pacman -Sc

    echo "Updating AUR packages (if yay is installed)..."
    if command -v yay >/dev/null 2>&1; then
        yay -Syu
    else
        echo "yay not found. Skipping AUR update."
    fi

    echo "System update completed."
}

# Main script execution
check_root
update_system

