#!/bin/bash

# Generate a random filename with .sh extension
random_filename="memory_check_$(openssl rand -hex 8).sh"

# Copy the memory checking script to the randomly named file
cp /workspace/check_memory.sh /workspace/"$random_filename"

echo "Memory checking script saved to: $random_filename"
ls -la /workspace/"$random_filename"