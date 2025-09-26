# R script to create and save a bar plot

# Define data
categories <- c('A', 'B', 'C', 'D')
values <- c(10, 25, 15, 30)

# Create the bar plot
barplot(values, names.arg = categories, main = "Sample Bar Plot", xlab = "Category", ylab = "Value")

# Save the plot as a PNG file
png("bar_plot.png")
barplot(values, names.arg = categories, main = "Sample Bar Plot", xlab = "Category", ylab = "Value")
dev.off()

print("Bar plot created and saved as bar_plot.png")