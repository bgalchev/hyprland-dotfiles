#!/bin/bash

# Path to network statistics
RX_PREV="/tmp/rx_prev"
TX_PREV="/tmp/tx_prev"
TIME_PREV="/tmp/time_prev"

# Check if the network statistics files are available
if [ ! -f /sys/class/net/enp42s0/statistics/rx_bytes ] || [ ! -f /sys/class/net/enp42s0/statistics/tx_bytes ]; then
    echo "Error: Network statistics files not found"
    exit 1
fi

# Get the current RX and TX byte counts
RX_BYTES=$(cat /sys/class/net/enp42s0/statistics/rx_bytes)
TX_BYTES=$(cat /sys/class/net/enp42s0/statistics/tx_bytes)
CURRENT_TIME=$(date +%s)

# Initialize previous values if they don't exist
if [ ! -f $RX_PREV ] || [ ! -f $TIME_PREV ]; then
    echo $RX_BYTES > $RX_PREV
    echo $TX_BYTES > $TX_PREV
    echo $CURRENT_TIME > $TIME_PREV
    echo '{"down": "0 KB/s", "up": "0 KB/s"}'
    exit 0
fi

# Read previous RX and TX byte counts and time
RX_BYTES_PREV=$(cat $RX_PREV)
TX_BYTES_PREV=$(cat $TX_PREV)
TIME_PREV_VAL=$(cat $TIME_PREV)

# Calculate the difference
RX_DIFF=$((RX_BYTES - RX_BYTES_PREV))
TX_DIFF=$((TX_BYTES - TX_BYTES_PREV))
TIME_DIFF=$((CURRENT_TIME - TIME_PREV_VAL))

# Save the current RX, TX byte counts, and time for the next interval
echo $RX_BYTES > $RX_PREV
echo $TX_BYTES > $TX_PREV
echo $CURRENT_TIME > $TIME_PREV

# Avoid division by zero
if [ $TIME_DIFF -le 0 ]; then
    TIME_DIFF=1
fi

# Calculate speeds (bytes per second)
RX_RATE=$((RX_DIFF / TIME_DIFF))
TX_RATE=$((TX_DIFF / TIME_DIFF))

# Convert speeds to KB/s with higher precision
RX_RATE_KB=$(echo "scale=2; $RX_RATE / 1024" | bc)
TX_RATE_KB=$(echo "scale=2; $TX_RATE / 1024" | bc)

# Output JSON only
echo "{\"down\": \"${RX_RATE_KB} KB/s\", \"up\": \"${TX_RATE_KB} KB/s\"}"

