#!/bin/bash

# Script to check disk usage and alert if over 80%
# Get disk usage percentage (using / as the root filesystem)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is greater than 80%
if [ "$USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is at ${USAGE}% which exceeds the 80% threshold!"
    # Optionally send email or other notifications here
    # mail -s "Disk Usage Alert" admin@example.com <<< "Disk usage is at ${USAGE}%"
else
    echo "Disk usage is at ${USAGE}%. All good."
fi