#!/usr/bin/env ruby

# Create an array of elements
array = ['apple', 'banana', 'cherry', 'date', 'elderberry']

puts "Using .each block to iterate through array:"
array.each do |element|
  puts element
end

puts "\nUsing .each block with a different syntax:"
array.each { |element| puts "Element: #{element}" }

puts "\nUsing .map to transform elements:"
capitalized = array.map { |element| element.capitalize }
puts capitalized

puts "\nUsing .select to filter elements:"
long_names = array.select { |element| element.length > 5 }
puts long_names