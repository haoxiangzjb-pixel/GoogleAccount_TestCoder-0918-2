# Randomly named R script to create a bar chart
# Generate sample data
set.seed(123)  # For reproducible results
categories <- c("Product A", "Product B", "Product C", "Product D", "Product E")
sales <- c(150, 200, 175, 225, 180)

# Create bar chart
png("bar_chart.png", width = 800, height = 600)  # Save chart as PNG
barplot(sales, 
        names.arg = categories,
        main = "Sales by Product",
        xlab = "Products",
        ylab = "Sales",
        col = rainbow(length(categories)),
        border = "black")
dev.off()  # Close the PNG device

# Print data to console
print(data.frame(Product = categories, Sales = sales))
