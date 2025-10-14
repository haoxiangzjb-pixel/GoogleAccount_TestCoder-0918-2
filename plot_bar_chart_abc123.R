# R script to create a bar plot and save it

# Create sample data
categories <- c("A", "B", "C", "D")
values <- c(23, 45, 56, 78)

# Create the bar plot
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Chart",
        xlab = "Categories",
        ylab = "Values",
        col = "skyblue",
        border = "black")

# Optionally, save the plot to a file
# png("my_bar_chart.png")
# barplot(values, 
#         names.arg = categories,
#         main = "Sample Bar Chart",
#         xlab = "Categories",
#         ylab = "Values",
#         col = "skyblue",
#         border = "black")
# dev.off()