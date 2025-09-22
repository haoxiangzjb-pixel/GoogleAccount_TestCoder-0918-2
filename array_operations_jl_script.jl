# Basic Array Operations in Julia
# This script demonstrates common array operations like sum and mean

using Statistics

# Create sample arrays
array1 = [1, 2, 3, 4, 5]
array2 = [10, 20, 30, 40, 50]
array3 = [2.5, 3.7, 1.2, 8.9, 4.1]

println("Array Operations Example")
println("="^30)

# Display the arrays
println("Array 1: ", array1)
println("Array 2: ", array2)
println("Array 3: ", array3)
println()

# Calculate sum of arrays
sum1 = sum(array1)
sum2 = sum(array2)
sum3 = sum(array3)

println("Sum of Array 1: ", sum1)
println("Sum of Array 2: ", sum2)
println("Sum of Array 3: ", sum3)
println()

# Calculate mean of arrays
mean1 = mean(array1)
mean2 = mean(array2)
mean3 = mean(array3)

println("Mean of Array 1: ", mean1)
println("Mean of Array 2: ", mean2)
println("Mean of Array 3: ", mean3)
println()

# Additional operations
println("Additional Operations")
println("-"^20)

# Element-wise operations
println("Array 1 + Array 2: ", array1 .+ array2)
println("Array 2 * 2: ", array2 .* 2)
println("Square of Array 1: ", array1 .^ 2)