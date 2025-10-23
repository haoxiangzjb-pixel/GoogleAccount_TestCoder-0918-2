# Процедура для вывода таблицы умножения
proc printMultiplicationTable() =
  echo "Таблица умножения:"
  for i in 1..9:
    for j in 1..9:
      stdout.write i * j
      if j < 9:
        stdout.write "\t"
    echo ""

# Вызов процедуры
printMultiplicationTable()