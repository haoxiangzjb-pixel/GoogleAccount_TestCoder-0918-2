let is_even n =
  n mod 2 = 0

(* Пример использования *)
let () =
  let num = 42 in
  if is_even num then
    Printf.printf "Число %d является четным.\n" num
  else
    Printf.printf "Число %d является нечетным.\n" num