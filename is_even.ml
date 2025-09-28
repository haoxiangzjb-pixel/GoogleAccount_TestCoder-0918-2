let is_even n =
  n mod 2 = 0

let () =
  Printf.printf "4 is even: %b\n" (is_even 4);
  Printf.printf "5 is even: %b\n" (is_even 5)