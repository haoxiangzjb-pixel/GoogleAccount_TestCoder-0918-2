#!/bin/bash

# 脚本：check_memory.sh
# 功能：检查系统内存使用情况，并将结果保存到一个随机命名的.sh文件中

# 获取内存使用情况，-h 选项使其以人类可读的格式显示
memory_info=$(free -h)

# 生成一个包含时间戳的随机文件名
random_filename="memory_report_$(date +%s%N).sh"

# 将内存信息写入随机命名的文件
echo "$memory_info" > "$random_filename"

echo "内存使用情况已保存到文件: $random_filename"