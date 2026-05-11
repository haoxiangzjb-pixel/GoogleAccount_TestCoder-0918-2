# 创建示例数据
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 12, 67, 34)

# 创建数据框
df <- data.frame(category = categories, value = values)

# 设置随机种子以确保可重复性（可选）
set.seed(Sys.time())

# 生成随机文件名
random_name <- paste0(sample(c(letters, 0:9), 8, replace = TRUE), collapse = "")
filename <- paste0("/workspace/", random_name, ".r")

# 定义要保存的脚本内容
script_content <- '
# 创建示例数据
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 12, 67, 34)

# 创建数据框
df <- data.frame(category = categories, value = values)

# 绘制柱状图
barplot(df$value, 
        names.arg = df$category,
        main = "Bar Plot Example",
        xlab = "Category",
        ylab = "Value",
        col = "steelblue",
        border = "white")
'

# 将脚本内容保存到随机命名的.r文件
writeLines(script_content, filename)

# 打印保存的文件名
cat("柱状图脚本已保存到:", filename, "\n")

# 绘制柱状图（在当前会话中显示）
barplot(df$value, 
        names.arg = df$category,
        main = "Bar Plot Example",
        xlab = "Category",
        ylab = "Value",
        col = "steelblue",
        border = "white")
