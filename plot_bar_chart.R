# Generate sample data
data <- data.frame(
  category = c("A", "B", "C", "D"),
  values = c(10, 15, 7, 12)
)

# Create bar plot
png("bar_chart.png", width = 600, height = 400)
barplot(data$values, 
        names.arg = data$category,
        main = "Sample Bar Chart",
        xlab = "Category",
        ylab = "Values",
        col = "lightblue",
        border = "black")
dev.off()

# Print confirmation
print("Bar chart saved as bar_chart.png")
print(data)