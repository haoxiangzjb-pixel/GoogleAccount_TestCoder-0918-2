#!/usr/bin/env ruby

# 定义一个数组
array = [1, 2, 3, 4, 5, 'hello', 'world', 10.5]

# 使用each块遍历数组并打印每个元素
puts "遍历数组并打印元素："
array.each do |element|
  puts element
end

# 另一种使用块的方式
puts "\n使用块参数的另一种方式："
array.each { |item| puts "元素: #{item}" }

# 使用map块的示例
puts "\n使用map块转换数组："
doubled = array.select { |x| x.is_a?(Numeric) }.map { |num| num * 2 }
puts doubled
