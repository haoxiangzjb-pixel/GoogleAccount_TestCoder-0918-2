(* MathUtils - OCaml module encapsulating mathematical functions *)

(* Constants *)
let pi = 4.0 *. atan 1.0
let e = exp 1.0

(* Basic arithmetic operations *)
let add x y = x +. y
let subtract x y = x -. y
let multiply x y = x *. y
let divide x y = 
  if y = 0.0 then failwith "Division by zero"
  else x /. y

(* Power and root functions *)
let power base exponent = base ** exponent
let square x = x *. x
let cube x = x *. x *. x
let sqrt x = 
  if x < 0.0 then failwith "Cannot compute square root of negative number"
  else sqrt x
let cbrt x = x ** (1.0 /. 3.0)

(* Trigonometric functions *)
let sin x = sin x
let cos x = cos x
let tan x = 
  let c = cos x in
  if c = 0.0 then failwith "Tangent undefined for this angle"
  else sin x /. c

(* Inverse trigonometric functions *)
let asin x = asin x
let acos x = acos x
let atan x = atan x
let atan2 y x = atan2 y x

(* Hyperbolic functions *)
let sinh x = sinh x
let cosh x = cosh x
let tanh x = tanh x

(* Logarithmic functions *)
let log x = 
  if x <= 0.0 then failwith "Logarithm undefined for non-positive numbers"
  else log x
let log10 x = 
  if x <= 0.0 then failwith "Logarithm undefined for non-positive numbers"
  else log x /. log 10.0
let ln x = 
  if x <= 0.0 then failwith "Logarithm undefined for non-positive numbers"
  else log x

(* Absolute value and sign functions *)
let abs x = abs_float x
let sign x = 
  if x > 0.0 then 1
  else if x < 0.0 then -1
  else 0

(* Rounding functions *)
let floor x = floor x
let ceil x = ceil x
let round x = floor (x +. 0.5)
let trunc x = 
  if x >= 0.0 then floor x
  else ceil x

(* Factorial (for integers) *)
let factorial n =
  if n < 0 then failwith "Factorial undefined for negative numbers"
  else
    let rec aux acc i =
      if i > n then acc
      else aux (acc * i) (i + 1)
    in
    float_of_int (aux 1 1)

(* Greatest common divisor *)
let gcd a b =
  let rec aux x y =
    if y = 0 then x
    else aux y (x mod y)
  in
  float_of_int (aux (int_of_float (abs a)) (int_of_float (abs b)))

(* Least common multiple *)
let lcm a b =
  if a = 0.0 || b = 0.0 then 0.0
  else abs (a *. b) /. gcd a b

(* Check if number is integer *)
let is_integer x = x = floor x

(* Clamp value between min and max *)
let clamp ~min_val ~max_val x =
  if x < min_val then min_val
  else if x > max_val then max_val
  else x

(* Linear interpolation *)
let lerp a b t = a +. (b -. a) *. t

(* Distance between two points *)
let distance x1 y1 x2 y2 =
  sqrt ((x2 -. x1) ** 2.0 +. (y2 -. y1) ** 2.0)

(* Convert degrees to radians *)
let deg_to_rad deg = deg *. pi /. 180.0

(* Convert radians to degrees *)
let rad_to_deg rad = rad *. 180.0 /. pi
