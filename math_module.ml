(* OCaml module for mathematical functions *)
module Math = struct
  (* Basic arithmetic operations *)
  let add x y = x +. y
  let subtract x y = x -. y
  let multiply x y = x *. y
  let divide x y = 
    if y = 0.0 then 
      failwith "Division by zero"
    else 
      x /. y

  (* Power and root functions *)
  let power base exponent = base ** exponent
  let square x = x *. x
  let cube x = x *. x *. x
  let sqrt x = 
    if x < 0.0 then 
      failwith "Square root of negative number"
    else 
      Stdlib.sqrt x

  (* Trigonometric functions *)
  let sin = Stdlib.sin
  let cos = Stdlib.cos
  let tan = Stdlib.tan
  let asin = Stdlib.asin
  let acos = Stdlib.acos
  let atan = Stdlib.atan
  let atan2 y x = Stdlib.atan2 y x

  (* Exponential and logarithmic functions *)
  let exp = Stdlib.exp
  let log = Stdlib.log
  let log10 = Stdlib.log10
  let log_base base x = (log x) /. (log base)

  (* Absolute value and sign *)
  let abs = Stdlib.abs_float
  let sign x = 
    if x > 0.0 then 1.0
    else if x < 0.0 then -1.0
    else 0.0

  (* Constants *)
  let pi = Stdlib.pi
  let e = exp 1.0

  (* Minimum and maximum *)
  let min x y = if x < y then x else y
  let max x y = if x > y then x else y

  (* Factorial for integers *)
  let factorial n = 
    if n < 0 then 
      failwith "Factorial of negative number"
    else
      let rec fact acc i = 
        if i <= 1 then acc
        else fact (acc * i) (i - 1)
      in fact 1 n

  (* Greatest Common Divisor *)
  let gcd a b = 
    let rec gcd_aux a b = 
      if b = 0 then abs a
      else gcd_aux b (a mod b)
    in gcd_aux (abs a) (abs b)

  (* Least Common Multiple *)
  let lcm a b = 
    if a = 0 || b = 0 then 0
    else (abs (a * b)) / (gcd a b)
end