# Load CSV file and print summary statistics

# Specify the path to your CSV file
csv_file_path <- "your_data.csv"  # Replace with your actual file path

# Load the CSV file into a data frame
data <- read.csv(csv_file_path)

# Print summary statistics
print("Summary Statistics:")
print(summary(data))

# Optionally, you can also print the structure of the data
print("Data Structure:")
str(data)