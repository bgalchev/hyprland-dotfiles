#!/bin/bash

# Function to set volume to 50%
set_volume_50() {
  pactl set-sink-volume @DEFAULT_SINK@ 50%
}

# Function to increase volume by 5%
increase_volume() {
  pactl set-sink-volume @DEFAULT_SINK@ +5%
}

# Function to decrease volume by 5%
decrease_volume() {
  pactl set-sink-volume @DEFAULT_SINK@ -5%
}

# Check the option passed to the script
while getopts ":o:" opt; do
  case $opt in
    o)
      case $OPTARG in
        m)
          set_volume_50
          ;;
        i)
          increase_volume
          ;;
        d)
          decrease_volume
          ;;
        *)
          echo "Invalid option: -$OPTARG" >&2
          exit 1
          ;;
      esac
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# If no options are passed, print usage
if [ $OPTIND -eq 1 ]; then
  echo "Usage: $0 -o [m|i|d]"
  echo "  -o m : Set volume to 50%"
  echo "  -o i : Increase volume by 5%"
  echo "  -o d : Decrease volume by 5%"
  exit 1
fi

