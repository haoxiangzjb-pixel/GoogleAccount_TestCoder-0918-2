# R script to generate the plot
data <- data.frame(categories = c("A", "B", "C", "D"), values = c(3, 1, 4, 2))
barplot(height=data$values, names.arg=data$categories, main = "Simple Barplot", xlab = "Categories", ylab = "Values")
