# R script to create a scatter plot and save it with a random filename

# Load required libraries (ggplot2 for enhanced plotting, though base R plot also works)
# Install if not already installed
if (!require(ggplot2)) {
  install.packages("ggplot2", quiet = TRUE)
  library(ggplot2)
}

# Generate random data for the scatter plot
set.seed(123)  # For reproducible results in this example
n_points <- 100
x <- rnorm(n_points)
y <- x + rnorm(n_points, sd = 0.5)  # y is related to x with some noise

# Create a random filename
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Create the scatter plot
# Using base R plotting
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

# Alternative using ggplot2
# Create a data frame
df <- data.frame(x = x, y = y)

# Generate another random filename for ggplot version
random_name_ggplot <- paste0("scatter_plot_ggplot_", sample(1000:9999, 1), ".png")

# Create the ggplot scatter plot
p <- ggplot(df, aes(x = x, y = y)) +
     geom_point(color = "blue", alpha = 0.6) +
     geom_smooth(method = "lm", se = TRUE, color = "red") +
     labs(title = "Scatter Plot with Regression Line",
          x = "X Values",
          y = "Y Values") +
     theme_minimal()

# Save the ggplot
ggsave(random_name_ggplot, plot = p, width = 8, height = 6, dpi = 300)

cat("Scatter plots saved as:", random_name, "and", random_name_ggplot, "\n")