# Load required library for generating random names
if (!require("uuid")) {
  install.packages("uuid", repos = "https://cran.rstudio.com/")
  library(uuid)
}

# Generate random filename
random_name <- paste0("scatter_plot_", UUIDgenerate(), ".png")
print(paste("Saving plot to:", random_name))

# Create sample data
x <- rnorm(100) # 100 random numbers for x-axis
y <- 2 * x + rnorm(100, sd = 0.5) # y-axis with some correlation and noise

# Save the plot as a PNG file
png(random_name, width = 800, height = 600)

# Create the scatter plot
plot(x, y,
     main = "Scatter Plot of Random Data",
     xlab = "X Variable",
     ylab = "Y Variable",
     pch = 19, # solid circles
     col = "blue" # color of points
)

# Close the PNG device to save the file
dev.off()

print(paste("Plot saved successfully to", random_name))