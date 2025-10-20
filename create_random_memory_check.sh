#!/bin/bash

# Generate a random filename with .sh extension
random_filename=$(mktemp --suffix=.sh)

# Write the memory checking commands to the randomly named file
cat > "$random_filename" << 'EOF'
#!/bin/bash

# Script to check system memory usage
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
EOF

echo "Memory check script created: $random_filename"
chmod +x "$random_filename"