proc printMultiplicationTable(size: int = 10) =
  ## Выводит таблицу умножения размером size x size
  # Вывод заголовка
  stdout.write "   |"
  for j in 1..size:
    stdout.write align($j, 4)
  stdout.write "\n"
  stdout.write "---+" & repeat("-", size * 4) & "\n"

  # Вывод строк таблицы
  for i in 1..size:
    stdout.write align($i, 3) & "|"
    for j in 1..size:
      stdout.write align($(i * j), 4)
    stdout.write "\n"

# Пример использования
printMultiplicationTable()