# R script to load a CSV file and print summary statistics
# Generate random filename for output

# Load necessary library
library(readr)

# Load CSV file (replace 'data.csv' with your actual file path)
# For demonstration, we'll create a sample dataset
data <- data.frame(
  x = rnorm(100, mean = 50, sd = 10),
  y = rnorm(100, mean = 30, sd = 5),
  category = sample(c("A", "B", "C"), 100, replace = TRUE)
)

# Save sample data to CSV
write.csv(data, "sample_data.csv", row.names = FALSE)

# Load the CSV file
loaded_data <- read.csv("sample_data.csv")

# Print summary statistics
print("Summary Statistics:")
print(summary(loaded_data))

# Additional statistics
print("Standard Deviations:")
print(sapply(loaded_data[, sapply(loaded_data, is.numeric)], sd))

print("Structure of the data:")
print(str(loaded_data))