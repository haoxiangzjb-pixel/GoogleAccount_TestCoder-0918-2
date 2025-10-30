(* Função recursiva de cauda para calcular o fatorial de um número *)
let fatorial n =
  let rec aux acc i =
    if i <= 1 then acc
    else aux (acc * i) (i - 1)
  in
  aux 1 n

(* Exemplo de uso *)
let () =
  print_int (fatorial 5);
  print_newline ();
  print_int (fatorial 0);
  print_newline ()