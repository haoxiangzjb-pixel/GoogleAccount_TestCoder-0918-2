# 创建一个 3x4 的随机矩阵
original_matrix = rand(3, 4)

# 对矩阵进行转置
transposed_matrix = transpose(original_matrix)

# 打印原始矩阵和转置后的矩阵
println("原始矩阵:")
println(original_matrix)

println("\n转置后的矩阵:")
println(transposed_matrix)

# 将结果保存到文件
open("matrix_results.txt", "w") do file
    write(file, "原始矩阵:\n")
    writedlm(file, original_matrix)
    write(file, "\n转置后的矩阵:\n")
    writedlm(file, transposed_matrix)
end

println("\n结果已保存到 matrix_results.txt")