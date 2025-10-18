# R script to create a bar plot

# Create sample data
data <- c(23, 45, 56, 78, 32, 50)
names(data) <- c("A", "B", "C", "D", "E", "F")

# Create bar plot
barplot(data, 
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue",
        border = "black")

# Optional: Save the plot to a file
# png("barplot.png")
# barplot(data, 
#         main = "Sample Bar Plot",
#         xlab = "Categories",
#         ylab = "Values",
#         col = "lightblue",
#         border = "black")
# dev.off()