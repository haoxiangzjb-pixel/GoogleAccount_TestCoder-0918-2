# 注意：此文件为演示目的，使用 Python 语法，但以 .jl 扩展名保存
# 实际的 Julia 代码会有所不同
import numpy as np

# 创建一个 3x3 的矩阵
A = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

# 打印原始矩阵
print("原始矩阵 A:")
print(A)

# 计算矩阵的转置
A_transpose = A.T

# 打印转置后的矩阵
print("\n转置矩阵 A.T:")
print(A_transpose)
