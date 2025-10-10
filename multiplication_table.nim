proc printMultiplicationTable() =
  ## Выводит таблицу умножения (9x9) в консоль.
  for i in 1..9:
    for j in 1..9:
      stdout.write(j, " * ", i, " = ", j * i)
      if j < 9:
        stdout.write("\t") # Добавляем табуляцию между выражениями
    stdout.write("\n") # Переходим на новую строку после каждой строки таблицы

# Вызов процедуры
printMultiplicationTable()