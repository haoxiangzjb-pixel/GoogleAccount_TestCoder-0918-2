(* OCaml数学模块 *)
module Math = struct
  (* 基本算术运算 *)
  let add x y = x + y
  let subtract x y = x - y
  let multiply x y = x * y
  let divide x y = 
    if y = 0 then failwith "Division by zero"
    else x / y

  (* 幂运算 *)
  let power base exp =
    let rec pow acc n =
      if n <= 0 then acc
      else pow (acc * base) (n - 1)
    in
    pow 1 exp

  (* 绝对值 *)
  let abs x = if x < 0 then -x else x

  (* 最大值和最小值 *)
  let max x y = if x > y then x else y
  let min x y = if x < y then x else y

  (* 阶乘 *)
  let factorial n =
    let rec fact acc i =
      if i <= 1 then acc
      else fact (acc * i) (i - 1)
    in
    if n < 0 then failwith "Factorial is not defined for negative numbers"
    else fact 1 n

  (* 判断是否为质数 *)
  let is_prime n =
    if n <= 1 then false
    else if n = 2 then true
    else if n mod 2 = 0 then false
    else
      let rec check_divisor i =
        if i * i > n then true
        else if n mod i = 0 then false
        else check_divisor (i + 2)
      in
      check_divisor 3

  (* 求平方根的近似值（牛顿法）*)
  let sqrt x =
    if x < 0.0 then failwith "Square root is not defined for negative numbers"
    else
      let rec improve_guess guess =
        let new_guess = (guess +. x /. guess) /. 2.0 in
        if abs_float (new_guess -. guess) < 0.000001 then new_guess
        else improve_guess new_guess
      in
      improve_guess 1.0

  (* 求最大公约数 *)
  let gcd a b =
    let rec gcd_helper a b =
      if b = 0 then a
      else gcd_helper b (a mod b)
    in
    gcd_helper (abs a) (abs b)

  (* 求最小公倍数 *)
  let lcm a b =
    if a = 0 || b = 0 then 0
    else abs (a * b) / (gcd a b)
end