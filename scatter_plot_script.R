# Generate random data
set.seed(123) # For reproducibility
n <- 100
x <- rnorm(n, mean = 50, sd = 10)
y <- 2 * x + rnorm(n, mean = 0, sd = 5)

# Create a random filename
random_name <- paste0("scatter_plot_", sample(10000:99999, 1), ".png")

# Plot and save to the random filename
png(random_name)
plot(x, y, 
     main = "Scatter Plot of Random Data",
     xlab = "X Values",
     ylab = "Y Values",
     pch = 19,
     col = "blue")
dev.off()

# Print the filename to confirm
cat("Plot saved as:", random_name, "\n")