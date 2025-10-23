# Load CSV file and print summary statistics
# Read the CSV file (assuming it's in the current directory)
data <- read.csv("data.csv")

# Print basic summary statistics
print("Summary Statistics:")
print(summary(data))

# Print structure of the data
print("Data Structure:")
print(str(data))

# Print first few rows
print("First 6 rows:")
print(head(data))