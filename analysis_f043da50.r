# Load a CSV file and print summary statistics
# This script assumes the CSV file path will be provided as needed

# Function to load CSV and print summary statistics
load_and_summarize <- function(file_path) {
  # Load the CSV file
  data <- read.csv(file_path, header = TRUE)
  
  cat("Summary Statistics for:", file_path, "\n")
  cat("========================================\n")
  
  # Print basic summary statistics
  print(summary(data))
  
  # Print dimensions of the dataset
  cat("\nDataset Dimensions:", dim(data)[1], "rows x", dim(data)[2], "columns\n")
  
  # Print column names
  cat("\nColumn Names:\n")
  print(names(data))
  
  # Print data types of each column
  cat("\nData Types:\n")
  print(sapply(data, class))
  
  # If there are numeric columns, print additional statistics
  numeric_cols <- sapply(data, is.numeric)
  if(any(numeric_cols)) {
    cat("\nNumeric Column Statistics:\n")
    print(sapply(data[numeric_cols], function(x) c(
      Mean = mean(x, na.rm = TRUE),
      Median = median(x, na.rm = TRUE),
      SD = sd(x, na.rm = TRUE),
      Min = min(x, na.rm = TRUE),
      Max = max(x, na.rm = TRUE)
    )))
  }
  
  return(data)
}

# Example usage (uncomment the next line and provide a file path to use):
# load_and_summarize("your_file.csv")