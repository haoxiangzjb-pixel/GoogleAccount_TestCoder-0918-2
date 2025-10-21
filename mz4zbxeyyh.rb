# Ruby script to iterate through an array using blocks and print elements

# Define an array
array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Using each block to iterate through the array and print elements
puts "Using each block:"
array.each do |element|
  puts element
end

puts "\nUsing map block:"
# Using map block to transform and print elements
doubled = array.map do |element|
  element * 2
end
puts doubled

puts "\nUsing select block:"
# Using select block to filter and print even numbers
even_numbers = array.select do |element|
  element.even?
end
puts even_numbers