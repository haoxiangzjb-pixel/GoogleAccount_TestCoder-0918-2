# 安装和加载必要的库
if (!require('ggplot2')) install.packages('ggplot2')
library(ggplot2)

# 创建示例数据
data <- data.frame(
  category = c("A", "B", "C", "D"),
  values = c(23, 45, 56, 78)
)

# 绘制柱状图
p <- ggplot(data, aes(x=category, y=values)) +
  geom_col(fill = "steelblue") +
  labs(title = "示例柱状图", x = "类别", y = "值") +
  theme_minimal()

# 保存图表到文件
output_filename <- paste0("bar_plot_", Sys.time(), ".png")
output_filename <- gsub(" ", "_", output_filename)
output_filename <- gsub(":", "-", output_filename)
ggsave(output_filename, plot = p, width = 8, height = 6, dpi = 300)

# 打印保存信息
cat("图表已保存至:", output_filename, "\n")