# Script to create a scatter plot and save it with a random filename

# Generate random data
set.seed(42)  # For reproducible random results in this example
n <- 100
x <- rnorm(n)
y <- rnorm(n)

# Create a random filename
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Create the plot
plot(x, y, 
     main = "Scatter Plot", 
     xlab = "X values", 
     ylab = "Y values", 
     pch = 19,  # solid circles
     col = "blue"
)

# Save the plot to the random filename
png(random_name, width = 800, height = 600)
plot(x, y, 
     main = "Scatter Plot", 
     xlab = "X values", 
     ylab = "Y values", 
     pch = 19, 
     col = "blue"
)
dev.off()

cat("Scatter plot saved as:", random_name, "\n")