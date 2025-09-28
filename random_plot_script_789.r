# This is a randomly named R script to generate a bar chart.

# Define data
categories <- c("A", "B", "C", "D", "E")
values <- c(1, 2, 3, 4, 5)

# Create the bar plot and save it to a PDF
pdf('plot_from_script.pdf')
barplot(values,
        names.arg = categories,
        main = 'Bar Chart from Script',
        xlab = 'Categories',
        ylab = 'Values',
        col = 'lightblue',
        border = 'black')
dev.off()

cat("Bar chart saved as 'plot_from_script.pdf'\n")