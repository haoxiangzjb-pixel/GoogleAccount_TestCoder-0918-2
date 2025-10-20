#!/bin/bash

# Script to check disk usage and alert if over 80%

# Get the disk usage percentage (removing the % sign)
usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is greater than 80
if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is ${usage}% which is above the 80% threshold!"
    # You could add additional alert mechanisms here (email, logging, etc.)
else
    echo "Disk usage is ${usage}%, which is within acceptable limits."
fi