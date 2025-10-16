# Load a CSV file and print summary statistics

# Specify the path to your CSV file
# For this example, we'll assume the file is named 'data.csv' in the current directory
file_path <- "data.csv"

# Load the CSV file into a data frame
data <- read.csv(file_path)

# Print the first few rows of the data frame to inspect it
print("First 6 rows of the data:")
print(head(data))

# Print summary statistics for each column
print("Summary statistics:")
print(summary(data))

# Optionally, you can also print the structure of the data frame
print("Data frame structure:")
print(str(data))