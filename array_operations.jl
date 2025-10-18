# Julia script for basic array operations

# Function to calculate sum of array elements
function calculate_sum(arr)
    return sum(arr)
end

# Function to calculate mean of array elements
function calculate_mean(arr)
    return mean(arr)
end

# Example usage
arr = [1, 2, 3, 4, 5]

println("Array: ", arr)
println("Sum: ", calculate_sum(arr))
println("Mean: ", calculate_mean(arr))