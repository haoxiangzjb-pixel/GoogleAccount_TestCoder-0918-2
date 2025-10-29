# R script to create a scatter plot and save it with a random filename

# Load required libraries
library(graphics)

# Generate some sample data
set.seed(42)  # For reproducible random results
x <- rnorm(100, mean = 50, sd = 15)
y <- 2 * x + rnorm(100, mean = 0, sd = 10)

# Create a random filename
random_string <- paste(sample(c(letters, LETTERS, 0:9), 10, replace = TRUE), collapse = "")
plot_filename <- paste0("scatter_plot_", random_string, ".png")

# Create the scatter plot
png(plot_filename, width = 800, height = 600)
plot(x, y, 
     main = "Scatter Plot Example", 
     xlab = "X Values", 
     ylab = "Y Values",
     pch = 19,  # solid circles
     col = rgb(0.2, 0.4, 0.6, 0.6),  # semi-transparent blue
     cex = 1.2  # point size
)

# Add a trend line
abline(lm(y ~ x), col = "red", lwd = 2)

# Add grid
grid(col = "lightgray", lty = "dotted", lwd = par("cex"))

dev.off()

cat("Scatter plot saved as:", plot_filename, "\n")