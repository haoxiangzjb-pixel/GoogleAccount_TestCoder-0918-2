# R script to create a bar chart
# Generate sample data
data <- data.frame(
  category = c("A", "B", "C", "D", "E"),
  values = c(23, 45, 56, 78, 32)
)

# Create bar chart
barplot(data$values, 
        names.arg = data$category,
        main = "Sample Bar Chart",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue",
        border = "black")

# Alternative using ggplot2 (uncomment if you want to use ggplot2 instead)
# library(ggplot2)
# p <- ggplot(data, aes(x = category, y = values)) +
#   geom_bar(stat = "identity", fill = "lightblue", color = "black") +
#   labs(title = "Sample Bar Chart", x = "Categories", y = "Values")
# print(p)