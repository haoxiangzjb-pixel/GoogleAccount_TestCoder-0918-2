# R Script to Load CSV and Print Summary Statistics
# Generate a random filename for the CSV data
csv_filename <- paste0("data_", sprintf("%06d", sample(1:999999, 1)), ".csv")

# Create sample data for demonstration
set.seed(123)  # For reproducibility
sample_data <- data.frame(
  ID = 1:100,
  Age = sample(18:80, 100, replace = TRUE),
  Income = round(rnorm(100, 50000, 15000)),
  Score = runif(100, 0, 100),
  Category = sample(c("A", "B", "C"), 100, replace = TRUE)
)

# Write sample data to CSV
write.csv(sample_data, csv_filename, row.names = FALSE)

# Load the CSV file
data <- read.csv(csv_filename)

# Print summary statistics
cat("Summary Statistics for", csv_filename, "\n")
cat("========================\n")
print(summary(data))

# Additional statistics
cat("\nStandard Deviations:\n")
print(sapply(data[, sapply(data, is.numeric)], sd))

cat("\nMissing Values:\n")
print(colSums(is.na(data)))