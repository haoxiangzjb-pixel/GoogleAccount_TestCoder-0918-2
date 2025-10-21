# R script to load a CSV file and print summary statistics

# Load CSV file (replace 'data.csv' with your actual file path)
# You can change the file path as needed
csv_file <- "data.csv"
data <- read.csv(csv_file)

# Print basic information about the dataset
cat("Dataset dimensions:", dim(data), "\n")
cat("Column names:", names(data), "\n\n")

# Print summary statistics
cat("Summary statistics:\n")
print(summary(data))

# Print structure of the dataset
cat("\nDataset structure:\n")
str(data)

# Print first few rows
cat("\nFirst 6 rows:\n")
print(head(data))