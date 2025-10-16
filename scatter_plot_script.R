# R script to create a scatter plot and save it with a random filename

# Generate some sample data
set.seed(123)  # For reproducible random numbers
x <- rnorm(100)
y <- 2*x + rnorm(100, sd=0.5)  # y is correlated with x

# Create a random filename
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Create the scatter plot
plot(x, y, 
     main="Scatter Plot", 
     xlab="X values", 
     ylab="Y values",
     pch=19,  # solid circles
     col="blue")

# Add a trend line
abline(lm(y~x), col="red", lwd=2)

# Save the plot with the random filename
png(random_name, width=800, height=600)
plot(x, y, 
     main="Scatter Plot", 
     xlab="X values", 
     ylab="Y values",
     pch=19,  # solid circles
     col="blue")
abline(lm(y~x), col="red", lwd=2)
dev.off()

cat("Scatter plot saved as:", random_name, "\n")