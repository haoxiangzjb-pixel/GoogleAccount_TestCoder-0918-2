#!/bin/bash

# Generate a random name for the memory check script
random_name="memory_check_$(date +%s%N | cut -c1-10).sh"

# Save the memory check script content to the randomly named file
cat > "$random_name" << 'EOF'
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

echo "Memory check script saved to: $random_name"
chmod +x "$random_name"
ls -l "$random_name"