# R script to create a bar plot
# Generate sample data
data <- data.frame(
  category = c("A", "B", "C", "D", "E"),
  values = c(23, 45, 56, 78, 32)
)

# Create bar plot
png("barplot.png", width = 800, height = 600)
barplot(data$values, 
        names.arg = data$category,
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue",
        border = "black")
dev.off()

# Alternative using ggplot2 (if available)
if(require(ggplot2)) {
  p <- ggplot(data, aes(x = category, y = values)) +
    geom_bar(stat = "identity", fill = "lightblue", color = "black") +
    labs(title = "Sample Bar Plot",
         x = "Categories",
         y = "Values") +
    theme_minimal()
  
  ggsave("ggplot_barplot.png", plot = p, width = 8, height = 6)
}

print("Bar plots have been created and saved as 'barplot.png' and optionally 'ggplot_barplot.png'")
print(data)