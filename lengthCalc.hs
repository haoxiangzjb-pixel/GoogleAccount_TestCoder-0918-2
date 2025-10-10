-- 递归函数计算列表长度
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

-- 示例用法
main :: IO ()
main = do
    let list = [1, 2, 3, 4, 5]
    putStrLn $ "The length of " ++ show list ++ " is " ++ show (myLength list)