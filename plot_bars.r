# R script to create a bar plot and save it

# Define data
categories <- c("A", "B", "C", "D")
values <- c(23, 45, 56, 78)

# Create the bar plot
barplot(values, 
        names.arg = categories,
        main = "Simple Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "skyblue",
        border = "black")

# Save the plot as a PNG file
png("bar_plot.png")
barplot(values, 
        names.arg = categories,
        main = "Simple Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "skyblue",
        border = "black")
dev.off()

cat("Bar plot created and saved as 'bar_plot.png'\n")