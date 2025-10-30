# Julia script for basic array operations

# Create a sample array
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println("Original array: ", arr)

# Calculate the sum of the array
sum_result = sum(arr)
println("Sum of array elements: ", sum_result)

# Calculate the mean of the array
mean_result = mean(arr)
println("Mean of array elements: ", mean_result)

# Additional array operations
println("Length of array: ", length(arr))
println("Maximum value: ", maximum(arr))
println("Minimum value: ", minimum(arr))

# Create another array for demonstration
arr2 = [2, 4, 6, 8, 10]

println("\nSecond array: ", arr2)
println("Sum of second array: ", sum(arr2))
println("Mean of second array: ", mean(arr2))

# Element-wise operations
println("\nAdding arrays element-wise: ", arr[1:length(arr2)] .+ arr2)
println("Multiplying first array by 2: ", arr .* 2)

# Demonstrating with random array
random_arr = rand(1:100, 10)  # Generate 10 random integers between 1 and 100
println("\nRandom array: ", random_arr)
println("Sum of random array: ", sum(random_arr))
println("Mean of random array: ", mean(random_arr))