-- | This module provides a function to calculate the factorial of a non-negative integer.
module Factorial where

-- | Calculates the factorial of a non-negative integer.
--   The factorial of n (denoted as n!) is the product of all positive integers less than or equal to n.
--   By definition, 0! is 1.
--   This function will raise an error if a negative number is passed.
factorial :: Integer -> Integer
factorial n
  | n < 0     = error "factorial is not defined for negative numbers"
  | n == 0    = 1
  | otherwise = n * factorial (n - 1)
