#!/bin/bash

# Take a screenshot with grim and slurp
grim -g "$(slurp)" ~/Pictures/Screenshot_$(date +%F_%T).png

