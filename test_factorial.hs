-- Test file for factorial function
import Factorial (factorial)

main :: IO ()
main = do
    putStrLn "Testing factorial function:"
    putStrLn $ "factorial 0 = " ++ show (factorial 0)
    putStrLn $ "factorial 1 = " ++ show (factorial 1)
    putStrLn $ "factorial 5 = " ++ show (factorial 5)
    putStrLn $ "factorial 10 = " ++ show (factorial 10)