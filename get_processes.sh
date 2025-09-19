#!/bin/bash

# Generate a random file name
random_name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)
file_name="processes_$random_name.txt"

# Get the list of processes and save to file
ps aux > "$file_name"

# Output confirmation
echo "Processes saved to $file_name"