# R script to create a bar plot and save it

# Create sample data
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 56, 78, 32)

# Create the bar plot
png("barplot.png", width = 800, height = 600)  # Save as PNG file
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

dev.off()  # Close the graphics device

# Print confirmation
cat("Bar plot saved as barplot.png\n")

# Alternative: Display the plot in console (uncomment if needed)
# barplot(values, 
#         names.arg = categories,
#         main = "Sample Bar Plot",
#         xlab = "Categories",
#         ylab = "Values",
#         col = "steelblue",
#         border = "black")