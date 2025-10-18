# R script to create a bar plot and save it

# Sample data
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 56, 78, 32)

# Create bar plot
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue",
        border = "black")

# Optional: Save the plot to a file
# png("barplot.png", width = 600, height = 400)
# barplot(values, 
#         names.arg = categories,
#         main = "Sample Bar Plot",
#         xlab = "Categories",
#         ylab = "Values",
#         col = "lightblue",
#         border = "black")
# dev.off()

# Print data summary
print("Data Summary:")
print(data.frame(Category = categories, Value = values))