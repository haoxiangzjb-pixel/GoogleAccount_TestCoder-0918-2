# Метод для вычисления факториала числа
def factorial(n)
  # Проверяем, является ли число неотрицательным целым
  raise ArgumentError, "Число должно быть неотрицательным целым" if n < 0 || n != n.to_i

  # Базовые случаи
  return 1 if n == 0 || n == 1

  # Вычисляем факториал итеративно
  result = 1
  (2..n).each do |i|
    result *= i
  end
  result
end

# Примеры использования
puts factorial(0) # => 1
puts factorial(1) # => 1
puts factorial(5) # => 120
puts factorial(7) # => 5040