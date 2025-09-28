#!/bin/bash

# Script to check system memory usage and save the report to a file with a random name

# Get memory usage information using the 'free' command and format it
memory_report=$(free -h)

# Generate a random filename for the output, ensuring it has a .sh extension
# This uses a combination of random characters and the date for uniqueness
output_file="/workspace/memory_report_$(date +%s%N).sh"

# Write the memory report to the randomly named file
echo "System Memory Report - Generated on $(date)" > "$output_file"
echo "" >> "$output_file"
echo "$memory_report" >> "$output_file"

echo "Memory report saved to: $output_file"
cat "$output_file"
