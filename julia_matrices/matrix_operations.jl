# 创建一个 3x4 的随机矩阵
original_matrix = rand(3, 4)

# 对矩阵进行转置
transposed_matrix = transpose(original_matrix)

# 打印原始矩阵和转置后的矩阵
println("原始矩阵:")
println(original_matrix)

println("\n转置后的矩阵:")
println(transposed_matrix)

# 保存矩阵到文件
open("original_matrix.txt", "w") do file
    writedlm(file, original_matrix)
end

open("transposed_matrix.txt", "w") do file
    writedlm(file, transposed_matrix)
end

println("\n矩阵已保存到 'original_matrix.txt' 和 'transposed_matrix.txt'")