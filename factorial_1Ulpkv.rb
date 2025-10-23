def factorial(n)
  return 1 if n <= 1
  (1..n).reduce(:*)
end
