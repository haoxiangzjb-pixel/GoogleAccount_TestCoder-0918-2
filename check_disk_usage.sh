#!/bin/bash

# Check disk usage and alert if over 80%

# Get the disk usage percentage for the root filesystem
usage=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//')

# Check if usage is greater than 80
if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is ${usage}%!"
    # You could add an email command here, e.g., mail -s "Disk Alert" user@example.com < /dev/null
else
    echo "Disk usage is ${usage}%, which is OK."
fi