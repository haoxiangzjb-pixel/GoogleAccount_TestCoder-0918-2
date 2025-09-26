#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80
USAGE=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//g')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${USAGE}%!"
else
    echo "Disk usage is ${USAGE}% (OK)"
fi