# An example of using a block to iterate over an array in Ruby
# Define an array of fruits
fruits = ['apple', 'banana', 'cherry', 'date']

# Use the .each method with a block to print each element
puts "Iterating over the array using a block:"
fruits.each do |fruit|
  puts fruit
end

# Alternative one-liner syntax
puts "\nUsing the one-liner syntax:"
fruits.each { |fruit| puts fruit }