#!/bin/bash

# 检查系统内存使用情况并打印

echo "当前系统内存使用情况："
free -h

echo " "
echo "当前系统内存使用百分比："
free | grep Mem | awk '{printf("%.2f%%", $3/$2 * 100.0)}'

