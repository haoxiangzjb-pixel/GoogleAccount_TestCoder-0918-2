# R script to create and save a bar plot
# 定义数据
categories <- c("A", "B", "C", "D")
values <- c(10, 15, 8, 12)

# 创建柱状图并保存为PNG文件
png("barplot.png", width = 480, height = 480)
barplot(values, 
        names.arg = categories,
        main = "Simple Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "skyblue",
        border = "black")
dev.off() # 关闭图形设备