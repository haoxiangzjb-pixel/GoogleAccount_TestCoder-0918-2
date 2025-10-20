#!/usr/bin/env ruby

# 创建一个示例数组
array = [1, 2, 3, 4, 5, 'hello', 'world', 10.5, true, false]

puts "遍历数组并打印元素："

# 使用each块遍历数组并打印每个元素
array.each do |element|
  puts element
end

puts "\n使用块的另一种方式遍历数组："

# 使用另一种语法
array.each { |element| puts "元素: #{element}" }