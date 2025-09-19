-- 递归计算列表长度的Haskell函数

-- 基本情况：空列表的长度为0
myLength :: [a] -> Int
myLength [] = 0
-- 递归情况：列表的长度等于1加上其余部分的长度
myLength (x:xs) = 1 + myLength xs

-- 示例用法
main :: IO ()
main = do
  let exampleList = [1, 2, 3, 4, 5]
  putStrLn $ "The length of " ++ show exampleList ++ " is " ++ show (myLength exampleList)