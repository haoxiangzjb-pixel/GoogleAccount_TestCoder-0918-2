main = print $ mergeLists [1, 2, 3] [4, 5, 6]
-- Function to merge two lists in Haskell
mergeLists :: [a] -> [a] -> [a]
mergeLists xs ys = xs ++ ys

-- Example usage:
-- mergeLists [1, 2, 3] [4, 5, 6] returns [1, 2, 3, 4, 5, 6]
-- mergeLists "Hello" "World" returns "HelloWorld"
