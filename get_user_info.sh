#!/bin/bash

# 获取当前用户名
USERNAME=$(whoami)

# 获取用户的家目录
HOME_DIR=$(eval echo ~$USERNAME)

# 获取用户的用户ID (UID)
USER_ID=$(id -u $USERNAME)

# 获取用户的组ID (GID)
GROUP_ID=$(id -g $USERNAME)

# 获取用户的全名 (GECOS字段)
FULL_NAME=$(getent passwd $USERNAME | cut -d: -f5)

# 将信息打印到标准输出
echo "当前用户信息:"
echo "用户名: $USERNAME"
echo "用户ID: $USER_ID"
echo "组ID: $GROUP_ID"
echo "家目录: $HOME_DIR"
echo "全名: $FULL_NAME"

# 将信息写入一个随机命名的文件
RAND_FILE="/tmp/user_info_$(date +%s%N).txt"
echo "用户名: $USERNAME" > $RAND_FILE
echo "用户ID: $USER_ID" >> $RAND_FILE
echo "组ID: $GROUP_ID" >> $RAND_FILE
echo "家目录: $HOME_DIR" >> $RAND_FILE
echo "全名: $FULL_NAME" >> $RAND_FILE

echo "用户信息已保存到: $RAND_FILE"