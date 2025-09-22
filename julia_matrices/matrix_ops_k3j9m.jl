# Julia script for matrix creation and transposition
using DelimitedFiles

# Create a 3x4 matrix filled with random numbers
original_matrix = rand(3, 4)

# Perform transposition
transposed_matrix = transpose(original_matrix)

# Display results
println("Original Matrix:")
println(original_matrix)

println("\nTransposed Matrix:")
println(transposed_matrix)

# Save matrices to files for verification
writedlm("original_matrix.txt", original_matrix, ' ')
writedlm("transposed_matrix.txt", transposed_matrix, ' ')