# R script to create a scatter plot and save with a random filename

# Generate sample data
set.seed(42)  # For reproducible results
x <- rnorm(100, mean = 5, sd = 2)
y <- 2 * x + rnorm(100, mean = 0, sd = 1)

# Create a scatter plot
plot(x, y, 
     main = "Scatter Plot Example", 
     xlab = "X Values", 
     ylab = "Y Values",
     pch = 19,  # Solid circles
     col = "blue")

# Add a regression line
abline(lm(y ~ x), col = "red", lwd = 2)

# Generate a random filename
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Save the plot to a file with the random name
png(random_name, width = 800, height = 600)
plot(x, y, 
     main = "Scatter Plot Example", 
     xlab = "X Values", 
     ylab = "Y Values",
     pch = 19,
     col = "blue")
abline(lm(y ~ x), col = "red", lwd = 2)
dev.off()

cat("Scatter plot saved as:", random_name, "\n")