# Load necessary library
# install.packages("readr") # Uncomment if you need to install the package
library(readr)

# Load CSV file (replace 'data.csv' with your actual file path)
# For this example, we'll create a sample dataset
data <- data.frame(
  ID = 1:100,
  Age = sample(18:80, 100, replace = TRUE),
  Income = sample(20000:100000, 100, replace = TRUE),
  Score = rnorm(100, mean = 75, sd = 10)
)

# Alternatively, to load from an actual CSV file, use:
# data <- read_csv("path/to/your/file.csv")

# Print summary statistics
print("Summary Statistics:")
print(summary(data))

# Print structure of the data
print("Data Structure:")
str(data)

# Print first few rows
print("First 6 rows:")
head(data)