# R script to create a bar plot
# This script creates a bar plot and saves it as a PNG file

# Create sample data
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 56, 78, 32)

# Print the data
print("Data for the bar plot:")
data <- data.frame(Category = categories, Value = values)
print(data)

# Create a bar plot and save it as a PNG file
png_filename <- paste0("barplot_", format(Sys.time(), "%Y%m%d_%H%M%S"), ".png")
png(png_filename, width = 800, height = 600)

# Create the bar plot
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "steelblue",
        border = "black")

# Add value labels on top of bars
text(x = seq(0.7, by = 1.2, length.out = length(values)), 
     y = values + 2, 
     labels = values, 
     pos = 3)

# Close the graphics device
dev.off()

# Print confirmation
cat("Bar plot saved as", png_filename, "\n")

# Alternative: Create the plot in R's plotting window (uncomment if running in R environment)
# barplot(values, 
#         names.arg = categories,
#         main = "Sample Bar Plot",
#         xlab = "Categories",
#         ylab = "Values",
#         col = rainbow(length(values)),
#         border = "black")