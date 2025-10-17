# Ruby script to iterate through an array using blocks and print elements

# Define an example array
fruits = ["apple", "banana", "cherry", "date", "elderberry"]

# Using each block to iterate and print elements
puts "Iterating through fruits array:"
fruits.each do |fruit|
  puts fruit
end

# Using map block to transform and print elements
puts "\nUsing map to transform elements:"
fruit_lengths = fruits.map do |fruit|
  puts "#{fruit} has #{fruit.length} characters"
  fruit.length
end

# Using select block to filter and print elements
puts "\nUsing select to filter elements with length > 5:"
long_fruits = fruits.select do |fruit|
  result = fruit.length > 5
  if result
    puts fruit
  end
  result
end