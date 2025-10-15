#!/bin/bash

# Script to check system memory usage
echo "Memory Usage Information:"
echo "-------------------------"
free -h
echo ""
echo "Detailed Memory Information:"
echo "-----------------------------"
cat /proc/meminfo | grep -E "MemTotal|MemFree|MemAvailable|Buffers|Cached"
echo ""
echo "Memory Usage Percentage:"
echo "------------------------"
free | awk 'NR==2{printf "Memory Usage: %.2f%%\n", $3*100/$2 }'