# Basic Array Operations in Julia

using Statistics

# Create a sample array
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println("Original array: ", arr)

# Calculate sum of the array
arr_sum = sum(arr)
println("Sum of array: ", arr_sum)

# Calculate mean of the array
arr_mean = mean(arr)
println("Mean of array: ", arr_mean)

# Additional operations
arr_max = maximum(arr)
arr_min = minimum(arr)
arr_length = length(arr)

println("Maximum value: ", arr_max)
println("Minimum value: ", arr_min)
println("Length of array: ", arr_length)

# Create another array for demonstration
arr2 = [2, 4, 6, 8, 10]

println("\nSecond array: ", arr2)
println("Sum of second array: ", sum(arr2))
println("Mean of second array: ", mean(arr2))

# Element-wise operations
println("\nAdding arrays element-wise: ", arr[1:5] .+ arr2)
println("Multiplying first array by 2: ", arr .* 2)

# Using built-in functions
println("\nStandard deviation of first array: ", std(arr))
println("Variance of first array: ", var(arr))