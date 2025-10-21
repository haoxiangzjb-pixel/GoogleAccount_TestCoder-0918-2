# R script to load CSV file and print summary statistics

# Load CSV file
# Note: Replace 'your_file.csv' with the actual path to your CSV file
data <- read.csv("your_file.csv")

# Print basic summary statistics
print("Summary Statistics:")
print(summary(data))

# Additional statistics
print("Structure of the data:")
str(data)

print("Dimensions of the data:")
print(dim(data))

# If the dataset has numeric columns, calculate correlation matrix
numeric_cols <- sapply(data, is.numeric)
if(any(numeric_cols)) {
  print("Correlation matrix for numeric columns:")
  print(cor(data[numeric_cols]))
}