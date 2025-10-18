def factorial(n)
  n <= 1 ? 1 : n * factorial(n - 1)
end

# Example usage:
# puts factorial(5)  # Output: 120