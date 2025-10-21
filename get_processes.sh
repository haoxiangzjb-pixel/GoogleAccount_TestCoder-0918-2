#!/bin/bash

# Script to get list of processes and save to a file with random name

# Generate a random filename
random_name=$(openssl rand -hex 8).txt

# Get the list of processes and save to the randomly named file
ps aux > "$random_name"

echo "Process list saved to: $random_name"