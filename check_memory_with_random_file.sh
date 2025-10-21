#!/bin/bash

# Generate a random filename
random_filename="memory_usage_$(date +%s)_$$.txt"

# Collect memory information and save to the random file
{
    echo "Memory Usage Information:"
    echo "========================="
    free -h
    echo ""
    echo "Detailed Memory Information:"
    echo "============================"
    cat /proc/meminfo
    echo ""
    echo "Memory Usage by Processes (Top 10):"
    echo "=================================="
    ps aux --sort=-%mem | head -11
} > "$random_filename"

echo "Memory information saved to: $random_filename"
cat "$random_filename"