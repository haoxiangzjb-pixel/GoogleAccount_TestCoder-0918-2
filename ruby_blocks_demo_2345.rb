#!/usr/bin/env ruby

# Demonstrating different ways to use blocks with arrays in Ruby

# Array of numbers
numbers = [1, 2, 3, 4, 5]

puts "Original array: #{numbers}"

# Using each block to print each element
puts "\nUsing each block:"
numbers.each { |num| puts "Number: #{num}" }

# Using collect/map block to transform elements
puts "\nUsing map block to double each number:"
doubled = numbers.map { |num| num * 2 }
puts doubled.inspect

# Using select block to filter elements
puts "\nUsing select block to get even numbers:"
even_numbers = numbers.select { |num| num.even? }
puts even_numbers.inspect

# Using reject block to exclude elements
puts "\nUsing reject block to exclude numbers greater than 3:"
filtered = numbers.reject { |num| num > 3 }
puts filtered.inspect

# Using inject/reduce block to accumulate values
puts "\nUsing reduce block to sum all numbers:"
sum = numbers.reduce(0) { |acc, num| acc + num }
puts sum

# Using find/detect block to find first match
puts "\nUsing find block to get first even number:"
first_even = numbers.find { |num| num.even? }
puts first_even

# Array of strings
words = ["apple", "banana", "cherry", "date"]

puts "\nString array: #{words}"

# Using each block with multiple parameters
puts "\nUsing each_with_index block:"
words.each_with_index do |word, index|
  puts "#{index + 1}. #{word}"
end

# Using any? block to check condition
puts "\nUsing any? block to check if any word starts with 'b':"
has_b_word = words.any? { |word| word.start_with?('b') }
puts has_b_word

# Using all? block to check condition
puts "\nUsing all? block to check if all words have length > 3:"
all_long_words = words.all? { |word| word.length > 3 }
puts all_long_words