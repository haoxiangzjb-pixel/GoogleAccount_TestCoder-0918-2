# Ruby script to iterate through an array using blocks and print elements

# Define an example array
array = [1, 2, 3, 4, 5, "hello", "world", 3.14]

# Using each block to iterate and print elements
puts "Using each block:"
array.each do |element|
  puts element
end

puts "\nUsing each block with curly braces:"
array.each { |element| puts element }

puts "\nUsing each_with_index block:"
array.each_with_index do |element, index|
  puts "Index: #{index}, Element: #{element}"
end