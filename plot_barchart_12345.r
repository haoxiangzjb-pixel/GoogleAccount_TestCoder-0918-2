# R script to create a bar chart

# Create sample data
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 56, 78, 32)

# Create the bar chart
barplot(values,
        names.arg = categories,
        main = "Sample Bar Chart",
        xlab = "Categories",
        ylab = "Values",
        col = "skyblue",
        border = "black")

# Print a message
print("Bar chart created successfully!")