# Процедура для вывода таблицы умножения
proc printMultiplicationTable() =
  for i in 1..10:
    for j in 1..10:
      stdout.write((i * j).align(4))
    echo() # Переход на новую строку после каждой строки таблицы

# Вызов процедуры
printMultiplicationTable()