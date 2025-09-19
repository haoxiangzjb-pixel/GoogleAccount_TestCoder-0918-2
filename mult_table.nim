import random, strformat

proc printMultiplicationTable(size: int) =
  for i in 1..size:
    for j in 1..size:
      stdout.write(fmt"{i*j:4}")
    stdout.write("\n")

proc main() =
  # Generate a random filename
  randomize()
  let fileName = "multiplication_table_" & $rand(1000..9999) & ".txt"
  
  # Redirect output to file
  let f = open(fileName, fmWrite)
  stdout = f
  
  # Print the table
  printMultiplicationTable(10)
  
  # Close file
  f.close()
  echo "Table saved to ", fileName

main()