#!/usr/bin/env ruby

# Ruby script demonstrating the use of blocks to iterate through arrays and print elements

# Example 1: Using .each with a block to print each element
puts "Example 1: Using .each with a block"
fruits = ["apple", "banana", "cherry", "date"]

fruits.each do |fruit|
  puts fruit
end

puts "\n" # Add a blank line for readability

# Example 2: Using .each with a block to print elements with index
puts "Example 2: Using .each_with_index to print elements with their index"
fruits.each_with_index do |fruit, index|
  puts "#{index + 1}. #{fruit}"
end

puts "\n" # Add a blank line for readability

# Example 3: Using .map with a block to transform and print elements
puts "Example 3: Using .map with a block to transform elements"
numbers = [1, 2, 3, 4, 5]
squared_numbers = numbers.map { |num| num ** 2 }
puts "Original numbers: #{numbers}"
puts "Squared numbers: #{squared_numbers}"

puts "\n" # Add a blank line for readability

# Example 4: Using .select with a block to filter and print elements
puts "Example 4: Using .select with a block to filter elements"
even_numbers = numbers.select { |num| num.even? }
puts "Even numbers from the array: #{even_numbers}"

puts "\n" # Add a blank line for readability

# Example 5: Using .collect with a block (same as .map) to transform and print
puts "Example 5: Using .collect (same as .map) to convert strings to uppercase"
uppercase_fruits = fruits.collect { |fruit| fruit.upcase }
puts "Uppercase fruits: #{uppercase_fruits}"

puts "\n" # Add a blank line for readability

# Example 6: Using .find_each (for demonstration - similar to .each)
puts "Example 6: Using a simple block with .each to print elements in a sentence"
fruits.each { |fruit| puts "I like #{fruit}!" }