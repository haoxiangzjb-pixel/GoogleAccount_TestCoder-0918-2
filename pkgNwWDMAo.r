# R script to load a CSV file and print summary statistics

# Load the CSV file
# Note: Replace 'your_file.csv' with the actual path to your CSV file
data <- read.csv("your_file.csv")

# Print basic summary statistics
print("Summary Statistics:")
print(summary(data))

# Additional statistics
print("Structure of the dataset:")
str(data)

print("Dimensions of the dataset:")
print(dim(data))

print("Column names:")
print(names(data))