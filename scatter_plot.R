# R script to create a scatter plot and save it with a random filename

# Generate random filename
random_name <- paste0("scatter_plot_", sample(10000:99999, 1), ".png")

# Create the scatter plot
plot(mtcars$wt, mtcars$mpg, 
     main="Scatter Plot: Weight vs MPG", 
     xlab="Weight (1000 lbs)", 
     ylab="Miles per Gallon",
     pch=19, 
     col="blue")

# Add a regression line
abline(lm(mpg ~ wt, data=mtcars), col="red", lwd=2)

# Save the plot with the random filename
png(random_name, width=800, height=600)
plot(mtcars$wt, mtcars$mpg, 
     main="Scatter Plot: Weight vs MPG", 
     xlab="Weight (1000 lbs)", 
     ylab="Miles per Gallon",
     pch=19, 
     col="blue")
abline(lm(mpg ~ wt, data=mtcars), col="red", lwd=2)
dev.off()

cat("Scatter plot saved as:", random_name, "\n")