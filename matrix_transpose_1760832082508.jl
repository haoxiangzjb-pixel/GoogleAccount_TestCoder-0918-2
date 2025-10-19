# Julia程序：创建矩阵并进行转置操作

# 创建一个3x3的矩阵
matrix = [1 2 3;
          4 5 6;
          7 8 9]

println("原始矩阵:")
display(matrix)
println()

# 进行转置操作
transposed_matrix = transpose(matrix)

println("转置后的矩阵:")
display(transposed_matrix)
println()

# 创建一个随机矩阵并进行转置
println("创建一个随机矩阵:")
random_matrix = rand(1:10, 4, 3)  # 创建一个4x3的随机整数矩阵
display(random_matrix)
println()

println("随机矩阵的转置:")
transposed_random = random_matrix'
display(transposed_random)
println()

# 使用不同的方法进行转置
println("使用 ' 符号进行转置:")
another_matrix = [1 4 7 10;
                  2 5 8 11;
                  3 6 9 12]
display(another_matrix)
println()
println("转置结果:")
display(another_matrix')
println()

println("程序执行完成!")