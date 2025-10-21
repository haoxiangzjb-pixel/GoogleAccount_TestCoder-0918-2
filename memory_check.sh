#!/bin/bash

# Script to check system memory usage
echo "Memory Usage Information:"
echo "========================="
free -h
echo ""
echo "Detailed Memory Information:"
echo "============================"
cat /proc/meminfo | grep -E "MemTotal|MemFree|MemAvailable|Buffers|Cached"
echo ""
echo "Memory Usage Percentage:"
echo "========================"
mem_percentage=$(free | grep Mem | awk '{printf("%.2f%%", $3/$2 * 100.0)}')
echo "Memory Usage: $mem_percentage"