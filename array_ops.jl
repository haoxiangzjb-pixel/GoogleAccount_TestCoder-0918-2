# array_ops.jl: Basic array operations in Julia

# Define a sample array
arr = [1, 2, 3, 4, 5]

# Calculate the sum
sum_result = sum(arr)
println("Sum of array: ", sum_result)

# Calculate the mean
mean_result = mean(arr)
println("Mean of array: ", mean_result)

# Perform operations on a 2D array
matrix = [1 2; 3 4]
println("Matrix:\n", matrix)
println("Sum of matrix: ", sum(matrix))
println("Mean of matrix: ", mean(matrix))

# Using a function for reusability
function calculate_sum_and_mean(data)
    s = sum(data)
    m = mean(data)
    return s, m
end

# Example usage of the function
data = [10, 20, 30]
s, m = calculate_sum_and_mean(data)
println("Function result - Sum: ", s, ", Mean: ", m)