#!/bin/bash

# Function to check disk usage
check_disk_usage() {
    # Get the disk usage percentage (removing the % symbol)
    usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
    
    echo "Current disk usage: ${usage}%"
    
    # Check if usage is greater than 80%
    if [ "$usage" -gt 80 ]; then
        echo "ALERT: Disk usage is ${usage}% which is over the 80% threshold!"
        # You can add additional alert mechanisms here (email, logging, etc.)
        exit 1
    else
        echo "Disk usage is within acceptable limits."
        exit 0
    fi
}

# Call the function
check_disk_usage