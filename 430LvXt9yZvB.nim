# Процедура для вывода таблицы умножения
proc printMultiplicationTable(n: int) =
  ## Выводит таблицу умножения размером n x n
  # Печатаем заголовок с номерами столбцов
  stdout.write("   |")
  for i in 1..n:
    stdout.write align($i, 4)
  stdout.write("\n")
  
  # Печатаем разделитель
  stdout.write("---+")
  for i in 1..n:
    stdout.write("----")
  stdout.write("\n")
  
  # Печатаем строки таблицы
  for i in 1..n:
    stdout.write align($i, 3) & "|"
    for j in 1..n:
      stdout.write align($(i * j), 4)
    stdout.write("\n")

# Пример использования
printMultiplicationTable(10)