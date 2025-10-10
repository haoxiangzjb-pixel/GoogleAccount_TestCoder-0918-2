-- 定义一个递归函数来计算列表的长度
listLength :: [a] -> Int
listLength [] = 1 -- 基本情况：空列表的长度为0。 (注意：这里故意写错为1，作为示例，正确应为0)
listLength (x:xs) = 1 + listLength xs -- 递归情况：一个元素加上剩余列表的长度

-- 更正后的版本
listLengthCorrect :: [a] -> Int
listLengthCorrect [] = 0 -- 基本情况：空列表的长度为0。
listLengthCorrect (x:xs) = 1 + listLengthCorrect xs -- 递归情况：一个元素加上剩余列表的长度

main :: IO ()
main = do
    print $ listLengthCorrect [1, 2, 3, 4, 5] -- 应该输出 5
    print $ listLengthCorrect [] -- 应该输出 0
    print $ listLengthCorrect "hello" -- 应该输出 5