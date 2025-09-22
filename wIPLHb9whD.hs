-- Haskell recursive function to calculate the length of a list
-- This function demonstrates pattern matching and recursion

-- Base case: empty list has length 0
myLength :: [a] -> Int
myLength [] = 0
-- Recursive case: length of list is 1 + length of tail
myLength (x:xs) = 1 + myLength xs

-- Example usage:
-- myLength [1,2,3,4,5] returns 5
-- myLength [] returns 0
-- myLength "Hello" returns 5