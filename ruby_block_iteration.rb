#!/usr/bin/env ruby

# Define an array of elements
array = ["apple", "banana", "cherry", "date", "elderberry"]

puts "Using each block to iterate through the array:"
array.each do |element|
  puts element
end

puts "\nUsing each_with_index block to iterate with index:"
array.each_with_index do |element, index|
  puts "#{index}: #{element}"
end

puts "\nUsing map block to transform elements:"
capitalized = array.map do |element|
  element.capitalize
end
puts capitalized.join(", ")

puts "\nUsing select block to filter elements:"
long_names = array.select do |element|
  element.length > 5
end
puts "Elements with more than 5 characters: #{long_names.join(", ")}"