arr = ['apple', 'banana', 'cherry', 'date']

puts 'Using each block:'
arr.each do |element|
  puts element
end

puts ''
puts 'Using each_with_index block:'
arr.each_with_index do |element, index|
  puts "#{index}: #{element}"
end

# Using a method that accepts a block
def process_array_with_block(array)
  count = 0
  array.each do |element|
    yield(element) if block_given?
    count += 1
  end
  count
end

puts ''
puts 'Using custom method with block:'
total = process_array_with_block(arr) do |item|
  puts "Processing: #{item}"
end
puts "Total elements processed: #{total}"