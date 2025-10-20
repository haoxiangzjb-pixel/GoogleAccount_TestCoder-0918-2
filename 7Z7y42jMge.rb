#!/usr/bin/env ruby

# Create an example array
array = [1, 2, 3, 4, 5, 'hello', 'world', 10.5]

puts "Original array: #{array}"

puts "\nUsing .each block to iterate through array:"
array.each do |element|
  puts "Element: #{element}"
end

puts "\nUsing .each_with_index block:"
array.each_with_index do |element, index|
  puts "Index: #{index}, Element: #{element}"
end

puts "\nUsing .map to transform elements:"
squared_numbers = array.select { |item| item.is_a?(Numeric) }.map { |num| num * num }
puts "Squared numbers from array: #{squared_numbers}"

puts "\nUsing block with different syntax:"
array.select { |item| item.is_a?(String) }.each { |str| puts "String element: #{str}" }