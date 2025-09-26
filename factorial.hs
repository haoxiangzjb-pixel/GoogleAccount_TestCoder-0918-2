-- | This module provides a function to calculate the factorial of a non-negative integer.
module Factorial where

-- | Calculates the factorial of a given non-negative integer.
--   The factorial of n (n!) is the product of all positive integers less than or equal to n.
--   By definition, the factorial of 0 is 1.
--
--   Examples:
--   >>> factorial 0
--   1
--   >>> factorial 1
--   1
--   >>> factorial 5
--   120
factorial :: Integer -> Integer
factorial n
  | n < 0     = error "Factorial is not defined for negative numbers"
  | n == 0    = 1
  | otherwise = n * factorial (n - 1)
