# basic_array_ops.jl: A script for basic array operations in Julia

# Define a sample array
arr = [1, 2, 3, 4, 5]

# Calculate the sum
array_sum = sum(arr)
println("Sum of the array: ", array_sum)

# Calculate the mean
array_mean = mean(arr)
println("Mean of the array: ", array_mean)

# Example with a different array
arr2 = [10.0, 20.0, 30.0]
println("\nFor the array: ", arr2)
println("Sum: ", sum(arr2))
println("Mean: ", mean(arr2))