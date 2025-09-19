#!/bin/bash

# Disk usage checker script
# Alerts if disk usage exceeds 80%

# Get disk usage percentage (using / partition as example)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage exceeds threshold
THRESHOLD=80

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "WARNING: Disk usage is at ${USAGE}% which exceeds the threshold of ${THRESHOLD}%"
    # Additional actions could be added here (email, logs, etc.)
else
    echo "Disk usage is at ${USAGE}%. All good!"
fi