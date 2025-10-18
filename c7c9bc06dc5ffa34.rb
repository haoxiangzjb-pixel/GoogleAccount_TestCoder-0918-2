# Ruby script using blocks to iterate through an array
my_array = ['apple', 'banana', 'cherry', 'date', 'elderberry']

puts 'Using each block to iterate through array:'
my_array.each do |element|
  puts element
end

puts "\nUsing each_with_index block:"
my_array.each_with_index do |element, index|
  puts "#{index + 1}. #{element}"
end

puts "\nUsing map block:"
capitalized = my_array.map { |element| element.capitalize }
puts 'Capitalized array: '
capitalized.each { |element| puts element }