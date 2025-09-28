# Ruby script to traverse an array using a block and print each element

# Define an array of elements
my_array = ['apple', 'banana', 'cherry', 'date']

# Use the `each` method to iterate over the array with a block
puts "Traversing the array:"
my_array.each do |element|
  puts element
end

puts "Traversal complete."