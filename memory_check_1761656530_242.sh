#!/bin/bash

# Function to check memory usage
check_memory_usage() {
    echo "Memory Usage Information:"
    echo "========================"
    free -h
    echo ""
    
    echo "Detailed Memory Information:"
    echo "============================"
    cat /proc/meminfo | grep -E "MemTotal|MemFree|MemAvailable|Buffers|Cached"
    echo ""
    
    echo "Memory Usage Percentage:"
    echo "========================"
    # Calculate memory usage percentage
    total_mem=$(free | awk 'NR==2{print $2}')
    used_mem=$(free | awk 'NR==2{print $3}')
    mem_percentage=$((used_mem * 100 / total_mem))
    echo "Memory Usage: $mem_percentage%"
}

# Call the function
check_memory_usage

