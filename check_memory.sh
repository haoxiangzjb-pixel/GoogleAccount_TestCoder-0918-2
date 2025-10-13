#!/bin/bash

# Script to check system memory usage and save the report to a file

# Get the current date and time for the output file name
timestamp=$(date +"%Y%m%d_%H%M%S")
output_file="/workspace/memory_usage_report_$timestamp.txt"

echo "Checking memory usage..."
free -h > "$output_file"

echo "Memory usage report saved to: $output_file"

# Also display the report on the terminal
cat "$output_file"
