proc printMultiplicationTable() =
  for i in 1..10:
    for j in 1..10:
      stdout.write(i * j, "\t")
    echo ""

# Call the procedure to print the table
printMultiplicationTable()