#!/bin/bash

# 检查系统内存使用情况的脚本

echo "-----------------------------"
echo "System Memory Usage Report"
echo "-----------------------------"
echo "Generated on: $(date)"
echo ""

# 使用 free 命令获取内存信息，并以人类可读的单位显示
echo "Memory Usage (MB):"
free -m
echo ""

# 使用 vmstat 命令获取更详细的虚拟内存统计信息
echo "Detailed Memory Stats (vmstat):"
vmstat -s
echo ""

# 检查内存使用率是否超过阈值 (例如 80%)
# 计算已使用内存百分比: (总内存 - 空闲内存 - 缓存) / 总内存 * 100
# 这里为了简化，使用 (总内存 - 可用内存) / 总内存 * 100，其中可用内存包含了缓存和缓冲区
memory_usage_percent=$(free | awk 'NR==2{printf "%.2f", ($3-$7+$6)*100/$2 }')
echo "Memory Usage Percentage (calculated): ${memory_usage_percent}%"
echo ""

# 定义阈值
threshold=80

# 比较使用率与阈值
if (( $(echo "$memory_usage_percent > $threshold" | bc -l) )); then
    echo "WARNING: Memory usage is above ${threshold}%!"
else
    echo "Memory usage is within normal limits."
fi

echo ""
echo "-----------------------------"
echo "End of Report"
echo "-----------------------------"