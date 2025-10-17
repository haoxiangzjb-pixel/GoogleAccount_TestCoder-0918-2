#!/bin/bash

# 创建随机命名的内存检查脚本
RANDOM_NAME="memory_check_$(date +%s)_$$.sh"
echo "创建随机命名的内存检查脚本: $RANDOM_NAME"

# 写入内存检查脚本内容
cat > "$RANDOM_NAME" << 'EOF'
#!/bin/bash

# 脚本：检查系统内存使用情况
# 作者：AI助手
# 创建日期：$(date)

echo "系统内存使用情况报告"
echo "生成时间: $(date)"
echo "========================================"

# 使用free命令获取内存信息
free -h

echo "========================================"
echo "详细内存信息 (MB):"
free -m

echo "========================================"
echo "内存使用率百分比:"
# 提取内存使用百分比
MEM_USAGE=$(free | grep Mem | awk '{printf("%.2f%%", $3/$2 * 100.0)}')
echo "内存使用率: $MEM_USAGE"

echo "========================================"
echo "各内存区域详情:"
cat /proc/meminfo | head -15

echo "========================================"
echo "脚本执行完毕"
EOF

# 使脚本可执行
chmod +x "$RANDOM_NAME"

echo "脚本已创建并保存为: $RANDOM_NAME"
echo "脚本内容如下："
echo "----------------------------------------"
cat "$RANDOM_NAME"
echo "----------------------------------------"
echo "脚本已创建完成！"