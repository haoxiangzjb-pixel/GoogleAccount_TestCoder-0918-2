# Generate random data
set.seed(123)  # For reproducibility
x <- rnorm(100)
y <- rnorm(100)

# Create scatter plot
plot(x, y, main="Random Scatter Plot", xlab="X Values", ylab="Y Values")

# Generate a random filename
random_name <- paste0("scatter_plot_", sample(10000:99999, 1), ".png")

# Save the plot to a file
png(random_name)
plot(x, y, main="Random Scatter Plot", xlab="X Values", ylab="Y Values")
dev.off()

# Print the filename to console
cat("Plot saved to:", random_name, "\n")