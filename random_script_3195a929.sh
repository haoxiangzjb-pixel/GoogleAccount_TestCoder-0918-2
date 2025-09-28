#!/bin/bash
# 获取当前用户名
USERNAME=$(whoami)
echo "当前用户名: $USERNAME"

# 获取当前用户的详细信息 (使用 id 命令)
USER_INFO=$(id)
echo "用户详细信息: $USER_INFO"

# 获取当前工作目录
CURRENT_DIR=$(pwd)
echo "当前目录: $CURRENT_DIR"