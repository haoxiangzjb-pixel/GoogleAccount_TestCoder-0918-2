# Multiplication Table Generator in Nim
# This program defines a procedure to print a multiplication table of a given size

proc printMultiplicationTable(size: int) =
  ## Prints a multiplication table of the specified size
  ##
  ## Args:
  ##   size: The size of the multiplication table (size x size)
  
  # Loop through rows
  for i in 1..size:
    # Loop through columns
    for j in 1..size:
      # Print the product with proper spacing
      stdout.write(($ (i * j)).align(4))
    # New line after each row
    stdout.write("\n")

# Main program execution
# Generate a 10x10 multiplication table
printMultiplicationTable(10)