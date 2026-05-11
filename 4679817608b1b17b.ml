let rec factorial n =
  if n <= 1 then 1
  else n * factorial (n - 1)

let () =
  let n = 5 in
  Printf.printf "Factorial of %d is %d\n" n (factorial n)
