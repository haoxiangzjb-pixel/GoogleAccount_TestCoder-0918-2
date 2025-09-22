# Basic Array Operations in Julia
# This script demonstrates sum and mean calculations on arrays

using Statistics

# Function to calculate sum of array elements
function array_sum(arr)
    return sum(arr)
end

# Function to calculate mean of array elements
function array_mean(arr)
    return mean(arr)
end

# Example usage
println("Basic Array Operations in Julia")
println("="^30)

# Create sample arrays
array1 = [1, 2, 3, 4, 5]
array2 = [10.5, 20.3, 15.7, 8.9, 12.1]
array3 = reshape(1:12, 3, 4)  # 3x4 matrix

println("Array 1: ", array1)
println("Sum: ", array_sum(array1))
println("Mean: ", array_mean(array1))
println()

println("Array 2: ", array2)
println("Sum: ", array_sum(array2))
println("Mean: ", array_mean(array2))
println()

println("Array 3 (3x4 matrix):")
println(array3)
println("Sum: ", array_sum(array3))
println("Mean: ", array_mean(array3))
println()

# Additional operations
println("Additional Operations")
println("-"^20)
println("Sum of all elements in Array 1 and Array 2: ", array_sum(array1) + array_sum(array2))
println("Mean of all elements in Array 1 and Array 2: ", array_mean(vcat(array1, array2)))