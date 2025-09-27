# basic_array_ops.jl
# This script demonstrates basic array operations in Julia.

# Define an example array
arr = [10, 20, 30, 40, 50]

println("Original array: ", arr)

# Calculate the sum of the array elements
sum_result = sum(arr)
println("Sum of array elements: ", sum_result)

# Calculate the mean of the array elements
mean_result = mean(arr)
println("Mean of array elements: ", mean_result)

# Perform operations on a 2D array
matrix = [1 2; 3 4; 5 6]
println("\nOriginal 2D array (Matrix): ")
println(matrix)

# Sum all elements in the matrix
matrix_sum = sum(matrix)
println("Sum of all elements in the matrix: ", matrix_sum)

# Calculate the mean across all elements in the matrix
matrix_mean = mean(matrix)
println("Mean of all elements in the matrix: ", matrix_mean)
