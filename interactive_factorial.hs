-- Interactive factorial calculator
import Factorial (factorial)

main :: IO ()
main = do
    putStrLn "Enter a number to calculate its factorial:"
    input <- getLine
    let n = read input :: Integer
    let result = factorial n
    putStrLn $ "The factorial of " ++ show n ++ " is " ++ show result