#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get the root filesystem usage percentage
usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Compare usage to threshold
if [ "$usage" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${usage}% which is above the ${THRESHOLD}% threshold!"
    exit 1
else
    echo "Disk usage is ${usage}%, which is OK."
    exit 0
fi