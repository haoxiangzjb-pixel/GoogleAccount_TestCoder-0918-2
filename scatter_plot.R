# Script to create a scatter plot and save it to a file with a random name

# Generate random data
set.seed(42)  # For reproducible results
x <- rnorm(100)
y <- rnorm(100)

# Create a random filename
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Create the scatter plot
png(random_name, width = 800, height = 600)
plot(x, y, 
     main = "Scatter Plot", 
     xlab = "X values", 
     ylab = "Y values", 
     pch = 19,  # Solid circles
     col = "blue"  # Color of points
)
abline(lm(y ~ x), col = "red")  # Add regression line
dev.off()  # Close the graphics device

cat("Scatter plot saved to:", random_name, "\n")