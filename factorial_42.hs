-- | This module defines a function to compute the factorial of a number.
module Factorial where

-- | Computes the factorial of a non-negative integer.
--   The factorial of n (n!) is the product of all positive integers less than or equal to n.
--   By definition, 0! is 1.
--   This function uses recursion.
factorial :: Integer -> Integer
factorial n
  | n < 0     = error "factorial is not defined for negative numbers"
  | n == 0    = 1
  | otherwise = n * factorial (n - 1)

-- Example usage:
-- factorial 5
-- factorial 0