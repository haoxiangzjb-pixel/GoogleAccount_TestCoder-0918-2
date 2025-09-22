(* Recursive factorial function in OCaml *)
let rec factorial n =
  if n <= 1 then 1
  else n * factorial (n - 1)

(* Main function to test the factorial function *)
let () =
  let test_values = [0; 1; 2; 3; 4; 5; 10] in
  List.iter (fun n ->
    Printf.printf "factorial(%d) = %d\n" n (factorial n)
  ) test_values