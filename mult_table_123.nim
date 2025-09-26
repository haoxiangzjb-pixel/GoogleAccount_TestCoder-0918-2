proc printMultiplicationTable() =
  for i in 1..9:
    for j in 1..9:
      let result = i * j
      stdout.write(j, " * ", i, " = ", result)
      if j < 9:
        stdout.write("\t")
    stdout.write("\n")

printMultiplicationTable()