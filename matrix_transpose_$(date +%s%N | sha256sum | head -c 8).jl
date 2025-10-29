# 创建一个3x3矩阵
A = [1 2 3; 4 5 6; 7 8 9]

println("原始矩阵 A:")
display(A)

# 对矩阵进行转置操作
A_transpose = A'

println("\n转置后的矩阵 A':")
display(A_transpose)

# 创建一个非方阵进行额外演示
B = [1 2 3 4; 5 6 7 8]

println("\n原始矩阵 B (2x4):")
display(B)

B_transpose = B'

println("\n转置后的矩阵 B' (4x2):")
display(B_transpose)