def factorial(n)
  if n < 0
    raise ArgumentError, "Факториал определен только для неотрицательных целых чисел"
  elsif n == 0 || n == 1
    1
  else
    (1..n).reduce(:*)
  end
end

# Пример использования:
# puts factorial(5) # => 120
# puts factorial(0) # => 1