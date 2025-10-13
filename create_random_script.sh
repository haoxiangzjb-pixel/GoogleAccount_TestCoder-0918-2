#!/bin/bash
# 生成一个随机文件名，格式为 random_XXXX.sh
RANDOM_FILENAME="random_$(openssl rand -hex 4).sh"
echo "生成的随机文件名为: $RANDOM_FILENAME"

# 将 get_user_info.sh 的内容复制到随机命名的文件中
cp /workspace/get_user_info.sh /workspace/$RANDOM_FILENAME

echo "脚本内容已复制到 $RANDOM_FILENAME"