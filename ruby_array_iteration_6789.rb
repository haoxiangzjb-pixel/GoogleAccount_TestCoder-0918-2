#!/usr/bin/env ruby

# Define an array of sample elements
array = [1, 2, 3, 4, 5, "hello", "world", 3.14]

puts "Using each block to iterate through the array:"
array.each do |element|
  puts element
end

puts "\nUsing each_with_index block to iterate with index:"
array.each_with_index do |element, index|
  puts "Index #{index}: #{element}"
end

puts "\nUsing map block to transform elements:"
squared_numbers = array.select { |item| item.is_a?(Numeric) }.map { |num| num * num }
puts "Squared numbers: #{squared_numbers}"

puts "\nUsing select block to filter elements:"
strings = array.select { |item| item.is_a?(String) }
puts "String elements: #{strings}"