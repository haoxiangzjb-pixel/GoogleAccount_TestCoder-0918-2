
# 示例数据
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 56, 78, 32)

# 绘制柱状图
barplot(values, 
        names.arg = categories,
        main = "示例柱状图",
        xlab = "类别",
        ylab = "数值",
        col = rainbow(length(categories)),
        border = "black")

