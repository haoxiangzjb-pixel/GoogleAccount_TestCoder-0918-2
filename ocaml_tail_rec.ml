(* Função recursiva de cauda para calcular o fatorial de um número *)
let factorial n =
  let rec factorial_aux acc i =
    if i <= 1 then acc
    else factorial_aux (acc * i) (i - 1)
  in
  factorial_aux 1 n

(* Exemplo de uso *)
let () =
  print_int (factorial 5);
  print_newline ()
