# Simple R script to create a scatter plot and save it with a random filename

# Generate random data for the scatter plot
set.seed(123)  # For reproducible results in this example
n_points <- 100
x <- rnorm(n_points)
y <- x + rnorm(n_points, sd = 0.5)  # y is related to x with some noise

# Create a random filename
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Create the scatter plot
png(random_name, width = 800, height = 600)
plot(x, y, 
     main = "Scatter Plot", 
     xlab = "X Values", 
     ylab = "Y Values",
     pch = 19,  # solid circles
     col = "blue",
     cex = 0.8)  # size of points
abline(lm(y ~ x), col = "red")  # Add regression line
dev.off()

cat("Scatter plot saved as:", random_name, "\n")