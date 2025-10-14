#!/bin/bash

# Script to check system memory usage and save it to a randomly named .sh file

# Get memory usage information using the 'free' command and save it to a variable
memory_info=$(free -h)

# Generate a random filename for the output file
random_filename=$(mktemp --suffix=.sh)

# Save the memory information to the randomly named file
echo "$memory_info" > "$random_filename"

# Print the name of the file where the information was saved
echo "Memory usage information saved to: $random_filename"

# Optionally, display the content of the generated file
echo "Content of the generated file:"
cat "$random_filename"