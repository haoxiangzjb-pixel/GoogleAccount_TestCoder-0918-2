# R script to load a CSV file and print summary statistics

# Load required library (if needed for additional functionality)
# library(readr)  # Alternative CSV loading library

# Load CSV file - replace 'data.csv' with the actual file path
# For this example, we'll use a placeholder file name
csv_file <- "data.csv"  # You can change this to your actual file path

# Load the data
data <- read.csv(csv_file, header = TRUE, stringsAsFactors = FALSE)

# Print basic information about the dataset
cat("Dataset dimensions:", dim(data), "\n")
cat("Column names:", names(data), "\n\n")

# Print summary statistics
cat("Summary statistics:\n")
print(summary(data))

# Print structure of the data
cat("\nData structure:\n")
str(data)

# Print first few rows
cat("\nFirst 6 rows:\n")
print(head(data))