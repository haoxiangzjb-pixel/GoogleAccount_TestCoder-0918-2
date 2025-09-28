-- This function calculates the length of a list recursively.
myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs