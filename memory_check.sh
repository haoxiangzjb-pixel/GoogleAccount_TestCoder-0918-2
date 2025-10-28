#!/bin/bash

# Function to check memory usage and save to a randomly named .sh file
check_memory_and_save() {
    # Get memory usage information
    memory_info=$(free -h)
    memory_percentage=$(free | grep Mem | awk '{printf("%.2f"), $3/$2 * 100.0}')
    
    # Create the content for the script
    content="#!/bin/bash
# Memory Usage Report
# Generated on: $(date)

echo \"Memory Usage Information:\"
echo \"==========================\"
$memory_info

echo
echo \"Memory Utilization: ${memory_percentage}%\"

# Additional memory details
echo
echo \"Detailed Memory Information:\"
echo \"==============================\"
cat /proc/meminfo | head -20
"

    # Generate a random filename with .sh extension
    random_filename=$(mktemp --suffix=.sh)
    
    # Write the content to the randomly named file
    echo "$content" > "$random_filename"
    
    # Make the file executable
    chmod +x "$random_filename"
    
    echo "Memory usage information saved to: $random_filename"
    echo "Content of the file:"
    echo "=================="
    cat "$random_filename"
}

# Call the function
check_memory_and_save