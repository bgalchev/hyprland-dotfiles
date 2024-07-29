#!/bin/bash

# Define the terminal command (you can change this if you use a different terminal emulator)
TERMINAL="kitty-terminal"

# Get clipboard history using wl-clipboard
CLIPBOARD_HISTORY=$(wl-paste -l)

# Open a new terminal and echo the clipboard history
$TERMINAL -- bash -c "echo 'Clipboard History:'; echo '$CLIPBOARD_HISTORY'; exec bash"

