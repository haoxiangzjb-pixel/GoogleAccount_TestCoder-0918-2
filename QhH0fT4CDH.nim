# Процедура для вывода таблицы умножения на экран

proc printMultiplicationTable*(size: int = 10) =
  ## Выводит таблицу умножения от 1 до size
  for i in 1..size:
    for j in 1..size:
      stdout.write($i & " x " & $j & " = " & $(i * j))
      if j < size:
        stdout.write(", ")
    echo ""

# Основная программа
when isMainModule:
  printMultiplicationTable(10)
