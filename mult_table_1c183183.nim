proc printMultiplicationTable(size: int) =
  ## Выводит таблицу умножения размером size x size
  # Печатаем заголовок
  stdout.write("    ")
  for j in 1..size:
    stdout.write(j, " ")
  stdout.write("\n")
  
  # Печатаем разделитель
  stdout.write("   ")
  for j in 1..size:
    stdout.write("---")
  stdout.write("\n")
  
  # Печатаем строки таблицы
  for i in 1..size:
    stdout.write(i, " | ")
    for j in 1..size:
      stdout.write(i * j, " ")
    stdout.write("\n")

# Пример использования
printMultiplicationTable(9)