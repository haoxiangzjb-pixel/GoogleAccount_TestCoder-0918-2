def factorial(n)
  if n < 0
    raise ArgumentError, "Факториал не определен для отрицательных чисел"
  elsif n == 0 || n == 1
    1
  else
    (2..n).reduce(1, :*)
  end
end

# Примеры использования:
puts factorial(0) # => 1
puts factorial(1) # => 1
puts factorial(5) # => 120
puts factorial(10) # => 3628800