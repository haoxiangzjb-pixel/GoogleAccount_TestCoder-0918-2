-- Haskell递归函数计算列表长度
-- 文件名: haskell_length_oSFssXg9lz.hs

-- 定义一个递归函数来计算列表的长度
myLength :: [a] -> Int
myLength [] = 0                    -- 基本情况：空列表的长度为0
myLength (_:xs) = 1 + myLength xs  -- 递归情况：列表长度等于1加上其余部分的长度

-- 示例用法
main :: IO ()
main = do
    putStrLn "列表 [1, 2, 3, 4, 5] 的长度是:"
    print (myLength [1, 2, 3, 4, 5])
    
    putStrLn "列表 [\"hello\", \"world\"] 的长度是:"
    print (myLength ["hello", "world"])
    
    putStrLn "空列表 [] 的长度是:"
    print (myLength [])