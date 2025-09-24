-- | Function to concatenate two lists.
-- This function takes two lists of the same type and returns a new list
-- containing all elements from the first list followed by all elements from the second list.
concatLists :: [a] -> [a] -> [a]
concatLists list1 list2 = list1 ++ list2

-- Example usage:
-- concatLists [1, 2, 3] [4, 5, 6]  -- Result: [1, 2, 3, 4, 5, 6]
-- concatLists "Hello" "World"        -- Result: "HelloWorld"