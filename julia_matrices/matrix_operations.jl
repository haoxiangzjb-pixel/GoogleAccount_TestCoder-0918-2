#!/usr/bin/env julia

# 创建一个 3x4 的随机矩阵
original_matrix = rand(3, 4)

println("原始矩阵:")
println(original_matrix)

# 对矩阵进行转置
transposed_matrix = transpose(original_matrix)

println("\n转置后的矩阵:")
println(transposed_matrix)

# 也可以使用 ' 符号进行转置
transposed_matrix_alt = original_matrix'

println("\n使用 ' 符号转置后的矩阵:")
println(transposed_matrix_alt)
