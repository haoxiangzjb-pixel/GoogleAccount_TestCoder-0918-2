# R script to create a bar plot and save it

# Define data
categories <- c("A", "B", "C", "D")
values <- c(3, 7, 5, 9)

# Create the bar plot
barplot(values, 
        names.arg = categories,
        main = "Simple Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue")

# Save the plot as a PNG file
# The file name is not random as R cannot easily save plots to a random file name directly.
# You would typically specify a name. Here we use a fixed name for demonstration.
# A true 'random' name would require more complex file system interaction outside of R's core plotting.
png("bar_plot_output.png")
barplot(values, 
        names.arg = categories,
        main = "Simple Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue")
dev.off()

cat("Bar plot created and saved as 'bar_plot_output.png'.\n")