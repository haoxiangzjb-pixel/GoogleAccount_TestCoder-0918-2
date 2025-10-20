#!/bin/bash

# Script to get a list of processes and save to a file with a random name

# Get the list of processes
processes=$(ps aux)

# Generate a random filename
random_name=$(mktemp --suffix=.txt)

# Save the processes to the file
echo "$processes" > "$random_name"

echo "Process list saved to: $random_name"