# 创建一个矩阵并进行转置操作

# 创建一个3x3的矩阵
matrix = [1 2 3; 4 5 6; 7 8 9]

println("原始矩阵:")
display(matrix)

# 进行转置操作
transposed_matrix = transpose(matrix)

println("\n转置后的矩阵:")
display(transposed_matrix)

# 也可以使用 ' 运算符进行转置
another_transposed = matrix'

println("\n使用 ' 运算符转置的矩阵:")
display(another_transposed)

# 创建一个非方阵进行测试
rect_matrix = [1 2 3 4; 5 6 7 8]

println("\n原始矩形矩阵:")
display(rect_matrix)

println("\n矩形矩阵的转置:")
display(transpose(rect_matrix))