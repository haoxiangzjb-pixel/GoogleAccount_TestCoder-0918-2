# Julia script for basic array operations
# This script demonstrates sum and mean operations on arrays

# Function to calculate the sum of elements in an array
function array_sum(arr)
    return sum(arr)
end

# Function to calculate the mean of elements in an array
function array_mean(arr)
    return mean(arr)
end

# Main execution
println("Array Operations in Julia")
println("========================")

# Create sample arrays
array1 = [1, 2, 3, 4, 5]
array2 = [10.5, 20.3, 30.7, 40.1, 50.9]
array3 = [2, 4, 6, 8, 10, 12, 14, 16]

println("\nSample Arrays:")
println("Array 1: ", array1)
println("Array 2: ", array2)
println("Array 3: ", array3)

# Perform operations on array1
println("\nOperations on Array 1:")
println("Sum: ", array_sum(array1))
println("Mean: ", array_mean(array1))

# Perform operations on array2
println("\nOperations on Array 2:")
println("Sum: ", array_sum(array2))
println("Mean: ", array_mean(array2))

# Perform operations on array3
println("\nOperations on Array 3:")
println("Sum: ", array_sum(array3))
println("Mean: ", array_mean(array3))

# Additional example with random array
println("\nRandom Array Example:")
random_array = rand(1:100, 10)  # Generate 10 random integers between 1 and 100
println("Random Array: ", random_array)
println("Sum: ", array_sum(random_array))
println("Mean: ", array_mean(random_array))