# Create a sample matrix
matrix = [1 2 3; 4 5 6; 7 8 9]
println("Original matrix:")
display(matrix)
println()

# Perform transpose operation
transposed_matrix = transpose(matrix)
# Alternative syntax: transposed_matrix = matrix'

println("Transposed matrix:")
display(transposed_matrix)
println()

# You can also use the shorthand ' operator
another_transpose = matrix'
println("Using ' operator:")
display(another_transpose)