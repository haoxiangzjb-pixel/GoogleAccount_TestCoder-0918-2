# R script to create a bar plot and save it

# Create sample data
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 56, 78, 32)

# Create the bar plot
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue",
        border = "black")

# Alternative way to create a more customized bar plot
# Create the plot and save it as a PNG file
png("barplot_output.png", width = 800, height = 600)
barplot(values, 
        names.arg = categories,
        main = "Customized Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = rainbow(length(values)),
        border = "black",
        cex.names = 1.2,  # Size of category names
        cex.axis = 1.2,   # Size of axis labels
        cex.main = 1.5)   # Size of main title
dev.off()

# Print data summary
print("Data Summary:")
print(data.frame(Category = categories, Value = values))