# Julia script for basic array operations
using Statistics

# Function to calculate sum of array elements
function calculate_sum(arr)
    return sum(arr)
end

# Function to calculate mean of array elements
function calculate_mean(arr)
    return mean(arr)
end

# Function to calculate other basic statistics
function calculate_min(arr)
    return minimum(arr)
end

function calculate_max(arr)
    return maximum(arr)
end

function calculate_std(arr)
    return std(arr)
end

# Example usage
println("Basic Array Operations in Julia")
println("=================================")

# Create a sample array
sample_array = [1, 5, 3, 9, 2, 8, 4, 7, 6]

println("Sample array: ", sample_array)

# Perform operations
array_sum = calculate_sum(sample_array)
array_mean = calculate_mean(sample_array)
array_min = calculate_min(sample_array)
array_max = calculate_max(sample_array)
array_std = calculate_std(sample_array)

println("Sum: ", array_sum)
println("Mean: ", array_mean)
println("Min: ", array_min)
println("Max: ", array_max)
println("Standard Deviation: ", array_std)

# Test with another array
println("\nTesting with another array:")
another_array = [10, 20, 30, 40, 50]
println("Array: ", another_array)
println("Sum: ", calculate_sum(another_array))
println("Mean: ", calculate_mean(another_array))