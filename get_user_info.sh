#!/bin/bash
# 获取当前用户名
USERNAME=$(whoami)
echo "当前用户名: $USERNAME"

# 获取当前用户的用户ID (UID)
USER_ID=$(id -u)
echo "用户ID (UID): $USER_ID"

# 获取当前用户的主目录
HOME_DIR=$(eval echo ~$USERNAME)
echo "主目录: $HOME_DIR"

# 获取当前用户的shell
USER_SHELL=$(getent passwd $USERNAME | cut -d: -f7)
echo "登录Shell: $USER_SHELL"