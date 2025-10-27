#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get the disk usage percentage (removing the % sign)
USAGE=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${USAGE}% which is above the threshold of ${THRESHOLD}%"
    # Optionally, you could send an email or log this to a file
    # echo "$(date): Disk usage is ${USAGE}%" >> /var/log/disk_usage.log
else
    echo "Disk usage is ${USAGE}%, which is within acceptable limits."
fi