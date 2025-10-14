# Процедура для вывода таблицы умножения
proc printMultiplicationTable() =
  for i in 1..9:
    for j in 1..9:
      stdout.write i * j
      if j < 9:
        stdout.write "\t"
    stdout.write "\n"

# Вызов процедуры
printMultiplicationTable()