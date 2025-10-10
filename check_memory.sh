#!/bin/bash

# Script to check system memory usage and display it

echo "Checking system memory usage..."
free -h

# Optionally, save the output to a log file with a timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
free -h > "memory_usage_${TIMESTAMP}.log"
echo "Memory usage also saved to memory_usage_${TIMESTAMP}.log"