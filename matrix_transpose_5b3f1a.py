import numpy as np

# 创建一个 3x3 的矩阵
matrix = np.array([[1, 2, 3],
                   [4, 5, 6],
                   [7, 8, 9]])

print("原始矩阵:")
print(matrix)

# 计算矩阵的转置
transposed_matrix = matrix.T

print("\n转置矩阵:")
print(transposed_matrix)
