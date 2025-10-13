# Метод для вычисления факториала
def factorial(n)
  return 1 if n <= 1
  (2..n).reduce(:*)
end

# Пример использования
puts factorial(5) # Выведет 120