#!/bin/bash

# Generate a random name for the memory check script
random_name="memory_check_$(openssl rand -hex 6).sh"

# Copy the memory checking script to the randomly named file
cp /workspace/check_memory.sh "$random_name"

echo "Memory check script saved to: $random_name"