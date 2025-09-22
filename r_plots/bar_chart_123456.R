# Generate random data
set.seed(123) # For reproducibility
categories <- c("A", "B", "C", "D", "E")
values <- sample(10:100, 5)

# Create the bar plot
barplot(values, names.arg = categories, col = "skyblue", 
        main = "Random Bar Chart", xlab = "Categories", ylab = "Values")

# Save the plot to a file (the R script itself)
# This line saves the current plot to a PNG file with a random name
random_name <- paste0("bar_chart_", sample(100000:999999, 1), ".png")
dev.copy(png, filename = random_name, width = 600, height = 400)
dev.off()

# Print the name of the saved file
print(paste("Plot saved as:", random_name))