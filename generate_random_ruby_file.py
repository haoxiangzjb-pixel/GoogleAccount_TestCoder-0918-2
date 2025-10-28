import uuid
import os

# 生成随机的Ruby文件名
random_filename = f"/workspace/random_{str(uuid.uuid4())[:8]}.rb"

# Ruby代码内容，使用块遍历数组并打印元素
ruby_code = '''#!/usr/bin/env ruby

# 定义一个数组
array = [1, 2, 3, 4, 5, 'hello', 'world', 10.5]

# 使用each块遍历数组并打印每个元素
puts "遍历数组并打印元素："
array.each do |element|
  puts element
end

# 另一种使用块的方式
puts "\\n使用块参数的另一种方式："
array.each { |item| puts "元素: #{item}" }

# 使用map块的示例
puts "\\n使用map块转换数组："
doubled = array.select { |x| x.is_a?(Numeric) }.map { |num| num * 2 }
puts doubled
'''

# 将Ruby代码写入随机命名的.rb文件
with open(random_filename, 'w', encoding='utf-8') as file:
    file.write(ruby_code)

print(f"已创建随机命名的Ruby文件: {random_filename}")