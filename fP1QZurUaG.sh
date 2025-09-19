#!/bin/bash

# Script to check disk usage and alert if over 80%
# Get disk usage percentage (using / as the root filesystem)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is over 80%
if [ "$USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is at ${USAGE}% - Cleanup recommended!"
    # Optionally send email or other alert here
else
    echo "Disk usage is at ${USAGE}% - Within acceptable limits"
fi