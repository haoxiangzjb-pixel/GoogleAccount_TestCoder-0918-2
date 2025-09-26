# Load data from a CSV file
# Replace 'your_file.csv' with the path to your actual CSV file
data <- read.csv('your_file.csv')

# Print the first few rows of the dataframe
print("First 6 rows:")
print(head(data))

# Print summary statistics for each column
print("Summary statistics:")
print(summary(data))

# Print the structure of the dataframe
print("Data structure:")
print(str(data))