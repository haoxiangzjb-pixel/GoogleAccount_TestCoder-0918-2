#!/bin/bash

# Check disk usage and alert if over 80%
usage=$(df / | grep -E '[0-9]+%' | awk '{ print $5 }' | sed 's/%//g')

if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is ${usage}%!"
else
    echo "Disk usage is OK: ${usage}%."
fi