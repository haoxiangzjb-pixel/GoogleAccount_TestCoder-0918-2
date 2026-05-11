(* Recursive factorial function *)
let rec factorial n =
  if n <= 1 then 1
  else n * factorial (n - 1)

(* Main entry point *)
let () =
  let n = 5 in
  let result = factorial n in
  Printf.printf "Factorial of %d is %d\n" n result
