-- 定义一个递归函数来计算列表的长度
listLength :: [a] -> Int
listLength [] = 0          -- 基本情况：空列表的长度为0
listLength (x:xs) = 1 + listLength xs  -- 递归情况：一个元素加上剩余列表的长度

-- 示例用法
main :: IO ()
main = do
    print $ listLength [1, 2, 3, 4, 5]  -- 输出: 5
    print $ listLength "hello"           -- 输出: 5
    print $ listLength ([] :: [Int])     -- 输出: 0