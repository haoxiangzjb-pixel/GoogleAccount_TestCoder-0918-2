-- Factorial function in Haskell
-- Using recursion
module Factorial (factorial) where

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Example usage:
-- factorial 5 would return 120