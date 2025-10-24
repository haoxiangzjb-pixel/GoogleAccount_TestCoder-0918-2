# Julia code to create a matrix and perform transpose operation

# Create a sample matrix
matrix = [1 2 3; 4 5 6; 7 8 9]

println("Original Matrix:")
display(matrix)

# Transpose the matrix
transposed_matrix = transpose(matrix)

println("\nTransposed Matrix:")
display(transposed_matrix)

# Alternative way to transpose using the ' operator
transposed_matrix_alt = matrix'

println("\nTransposed Matrix (using ' operator):")
display(transposed_matrix_alt)

# Create another example with a non-square matrix
rect_matrix = [1 2 3 4; 5 6 7 8]

println("\nOriginal Rectangular Matrix:")
display(rect_matrix)

println("\nTransposed Rectangular Matrix:")
display(transpose(rect_matrix))