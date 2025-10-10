-- |
-- Module      : ListLength
-- Description : A simple Haskell module to calculate the length of a list recursively.
-- Copyright   :
-- License     : GPL-3.0
-- Stability   : stable
-- Portability : POSIX

-- | The 'myLength' function calculates the length of a list using recursion.
-- It pattern matches on the list, adding 1 for each element until it reaches the empty list.
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

-- Example usage:
-- myLength [1, 2, 3, 4, 5]  -- Returns 5
-- myLength "hello"          -- Returns 5
-- myLength []              -- Returns 0
