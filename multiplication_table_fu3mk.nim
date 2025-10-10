proc printMultiplicationTable() =
  ## Выводит таблицу умножения размером 10x10
  for i in 1..10:
    for j in 1..10:
      stdout.write((i * j).align(4)) # Выравнивание по 4 символа
    stdout.write("\n") # Переход на новую строку после каждой строки таблицы

printMultiplicationTable()