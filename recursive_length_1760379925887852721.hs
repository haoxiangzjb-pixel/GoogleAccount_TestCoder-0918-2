module MyLib (listLength) where

-- | 计算列表长度的递归函数
listLength :: [a] -> Int
listLength [] = 0
listLength (_:xs) = 1 + listLength xs