
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

