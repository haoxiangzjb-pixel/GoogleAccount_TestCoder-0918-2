#!/bin/bash

# 获取当前用户名
username=$(whoami)

# 获取当前用户的家目录
home_dir=$(eval echo ~$username)

# 获取当前用户的用户ID
user_id=$(id -u $username)

# 获取当前用户的组ID
group_id=$(id -g $username)

# 获取当前用户的全名（GECOS字段）
full_name=$(getent passwd $username | cut -d: -f5)

# 创建包含用户信息的字符串
user_info="Current User Information:
Username: $username
User ID: $user_id
Group ID: $group_id
Home Directory: $home_dir
Full Name: $full_name
"

# 生成一个随机文件名，例如 user_info_随机数.sh
random_filename="user_info_$$.$(date +%s).sh"

# 将用户信息写入随机命名的文件
echo "$user_info" > "$random_filename"

echo "Current user information has been saved to $random_filename"
cat "$random_filename"