# Generate an array, sort it, and save to a file with a random name

# Create an array with random elements
array = []
20.times do
  array << rand(1..100)
end

puts "Original array: #{array}"

# Sort the array
sorted_array = array.sort
puts "Sorted array: #{sorted_array}"

# Generate a random filename
random_name = (1..8).map { ('a'..'z').to_a[rand(26)] }.join
filename = "/workspace/#{random_name}.txt"

# Write the sorted array to the file
File.write(filename, sorted_array.join(", "))

puts "Sorted array saved to #{filename}"