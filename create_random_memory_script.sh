#!/bin/bash

# Create a script that checks memory usage and saves it to a randomly named .sh file

# Generate a random name for the script
random_name="memory_check_$(date +%s)_$$.sh"

# Content of the memory checking script
memory_script_content="#!/bin/bash

# Function to check memory usage
check_memory_usage() {
    echo \"Memory Usage Information:\"
    echo \"========================\"
    free -h
    echo \"\"
    
    echo \"Detailed Memory Information:\"
    echo \"============================\"
    cat /proc/meminfo | grep -E \"MemTotal|MemFree|MemAvailable|Buffers|Cached\"
    echo \"\"
    
    echo \"Memory Usage Percentage:\"
    echo \"========================\"
    # Calculate memory usage percentage
    total_mem=\$(free | awk 'NR==2{print \$2}')
    used_mem=\$(free | awk 'NR==2{print \$3}')
    mem_percentage=\$((used_mem * 100 / total_mem))
    echo \"Memory Usage: \$mem_percentage%\"
}

# Call the function
check_memory_usage
"

# Write the content to the randomly named file
echo "$memory_script_content" > "$random_name"

# Make the script executable
chmod +x "$random_name"

echo "Memory checking script created: $random_name"
echo "You can run it with: ./$random_name"