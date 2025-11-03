# R script to create a scatter plot and save it with a random filename

# Generate random data for the scatter plot
set.seed(123)  # For reproducible results
x <- rnorm(100)
y <- 2 * x + rnorm(100, sd = 0.5)

# Generate a random filename
random_string <- paste(sample(c(letters, LETTERS, 0:9), 10, replace = TRUE), collapse = "")
filename <- paste0("scatter_plot_", random_string, ".png")

# Create the scatter plot
plot(x, y, 
     main = "Scatter Plot", 
     xlab = "X Values", 
     ylab = "Y Values",
     pch = 19,  # solid circles
     col = "blue")

# Add a trend line
abline(lm(y ~ x), col = "red", lwd = 2)

# Save the plot with the random filename
png(filename, width = 800, height = 600)
plot(x, y, 
     main = "Scatter Plot", 
     xlab = "X Values", 
     ylab = "Y Values",
     pch = 19,  # solid circles
     col = "blue")
abline(lm(y ~ x), col = "red", lwd = 2)
dev.off()

cat("Scatter plot saved as:", filename, "\n")