#!/bin/bash

# Script to check disk usage and alert if over 80%
# Get disk usage percentage for the root filesystem
USAGE=$(df / | tail -n +2 | awk '{print $5}' | sed 's/%//')

# Check if we got a valid usage value
if [[ ! $USAGE =~ ^[0-9]+$ ]]; then
    echo "Error: Could not determine disk usage"
    exit 1
fi

# Check if usage is over 80%
if [ $USAGE -gt 80 ]; then
    echo "WARNING: Disk usage is at ${USAGE}% - Over 80% threshold!"
    # You could add email alerting here if needed
    # echo "WARNING: Disk usage is at ${USAGE}%" | mail -s "Disk Usage Alert" admin@example.com
else
    echo "Disk usage is at ${USAGE}% - Within acceptable limits."
fi