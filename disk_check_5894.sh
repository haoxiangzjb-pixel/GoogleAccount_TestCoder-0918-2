#!/bin/bash

# Script to check disk usage and alert if over 80%
# Author: Assistant

# Get the disk usage percentage for the root filesystem
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is greater than 80%
if [ "$USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is at ${USAGE}% - Cleanup recommended!"
    # Optionally send email or other notification here
else
    echo "Disk usage is at ${USAGE}% - Within acceptable limits."
fi