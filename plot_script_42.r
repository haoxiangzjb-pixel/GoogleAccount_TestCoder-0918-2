# R script to create a bar plot and save it

# Define data
categories <- c("A", "B", "C", "D")
values <- c(10, 15, 8, 12)

# Create the bar plot
barplot(values, 
        names.arg = categories,
        main = "Simple Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "skyblue",
        border = "black")

# Save the plot as a PNG file
# You can change the filename and format (e.g., pdf, jpeg) as needed
filename <- "my_bar_plot.png"
png(filename, width = 600, height = 400)
barplot(values, 
        names.arg = categories,
        main = "Simple Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "skyblue",
        border = "black")
dev.off()

cat("Plot saved as", filename, "\n")