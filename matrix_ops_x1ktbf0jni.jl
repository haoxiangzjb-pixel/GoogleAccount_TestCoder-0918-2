# Julia程序：创建矩阵并进行转置操作

println("Julia矩阵和转置操作示例")

# 创建一个3x4的矩阵
A = [1 2 3 4;
     5 6 7 8;
     9 10 11 12]

println("原始矩阵 A:")
display(A)
println("\n")

# 对矩阵A进行转置
A_transpose = A'

println("转置后的矩阵 A':")
display(A_transpose)
println("\n")

# 创建另一个随机矩阵
B = rand(1:20, 2, 5)  # 2x5的随机整数矩阵

println("随机矩阵 B:")
display(B)
println("\n")

# 转置随机矩阵
B_transpose = transpose(B)

println("转置后的矩阵 B':")
display(B_transpose)
println("\n")

# 验证转置的性质：(A^T)^T = A
A_double_transpose = (A')'

println("验证转置性质 (A')' = A:")
if A == A_double_transpose
    println("正确：(A')' 等于 A")
else
    println("错误：(A')' 不等于 A")
end

println("\n程序执行完成！")