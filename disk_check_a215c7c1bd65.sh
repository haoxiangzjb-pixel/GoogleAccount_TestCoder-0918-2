#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get disk usage percentage (removing the % sign)
USAGE=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${USAGE}% which is over the ${THRESHOLD}% threshold!"
    # You could add additional alert mechanisms here (email, log to file, etc.)
    # For example: echo "Disk usage alert: ${USAGE}%" >> /var/log/disk_usage.log
else
    echo "Disk usage is ${USAGE}%, which is within acceptable limits."
fi