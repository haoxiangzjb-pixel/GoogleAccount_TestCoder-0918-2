#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get disk usage percentage (root filesystem)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${USAGE}% which is above the ${THRESHOLD}% threshold!"
    # You can add additional alert mechanisms here, such as:
    # - Sending an email
    # - Writing to a log file
    # - Sending a notification
else
    echo "Disk usage is ${USAGE}%, which is within acceptable limits."
fi