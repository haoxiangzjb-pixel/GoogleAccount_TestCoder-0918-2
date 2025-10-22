# R script to load a CSV file and print summary statistics

# Load required library (if needed for advanced summaries)
# library(summary)

# Function to load CSV and print summary statistics
load_and_summarize <- function(file_path) {
  # Load the CSV file
  data <- read.csv(file_path)
  
  cat("Summary Statistics for:", file_path, "\n")
  cat(rep("-", 50), "\n")
  
  # Print basic summary statistics
  print(summary(data))
  
  # Print structure of the data
  cat("\nData Structure:\n")
  str(data)
  
  # Print dimensions
  cat("\nDimensions (rows x columns):", dim(data)[1], "x", dim(data)[2], "\n")
  
  # Print column names
  cat("\nColumn Names:\n")
  print(names(data))
  
  return(data)
}

# Example usage (uncomment the line below and provide your CSV file path)
# my_data <- load_and_summarize("your_file.csv")