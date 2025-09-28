# 创建一个 3x3 的矩阵
A = [1 2 3; 4 5 6; 7 8 9]

# 打印原始矩阵
println("原始矩阵 A:")
display(A)

# 计算矩阵的转置
A_transpose = transpose(A)

# 或者使用简写形式 A'
# A_transpose = A'

# 打印转置后的矩阵
println("\n转置矩阵 A':")
display(A_transpose)
