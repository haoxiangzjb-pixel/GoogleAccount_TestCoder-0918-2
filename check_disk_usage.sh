#!/bin/bash

# Check disk usage and alert if over 80%

# Get the disk usage percentage for the root filesystem
usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is greater than 80
if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is at ${usage}%!"
    # Optionally, you could send an email or log this to a file here
else
    echo "Disk usage is at ${usage}%. It's OK."
fi