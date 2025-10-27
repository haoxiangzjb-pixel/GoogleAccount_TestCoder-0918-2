# R script to load CSV file and print summary statistics

# Load CSV file (replace 'data.csv' with your actual file path)
# You can change the file path as needed
data <- read.csv("data.csv")

# Print the structure of the data
cat("Data Structure:\n")
str(data)

# Print summary statistics
cat("\nSummary Statistics:\n")
print(summary(data))

# Print dimensions of the dataset
cat("\nDataset Dimensions (rows, columns):\n")
print(dim(data))

# Print column names
cat("\nColumn Names:\n")
print(names(data))

# Print first few rows
cat("\nFirst 6 rows:\n")
print(head(data))