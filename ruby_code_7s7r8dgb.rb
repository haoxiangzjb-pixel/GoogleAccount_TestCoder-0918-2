#!/usr/bin/env ruby

# 创建一个示例数组
array = [1, 2, 3, 4, 5, 'hello', 'world', 10.5]

# 使用each块遍历数组并打印每个元素
puts "使用each块遍历数组:"
array.each do |element|
  puts element
end

puts "\n使用each_with_index块遍历数组，并显示索引:"
array.each_with_index do |element, index|
  puts "索引 #{index}: #{element}"
end

# 使用times块遍历数组（另一种方法）
puts "\n使用times块遍历数组:"
array.length.times do |i|
  puts "元素 #{i}: #{array[i]}"
end