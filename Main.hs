import MyLib (listLength)

main :: IO ()
main = do
    let testList = [1, 2, 3, 4, 5]
    let len = listLength testList
    putStrLn $ "The length of the list " ++ show testList ++ " is " ++ show len ++ "."