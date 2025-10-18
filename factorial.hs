-- Function to compute the factorial of a number
factorial :: Integer -> Integer
factorial n
  | n < 0     = error "Factorial is not defined for negative numbers"
  | n == 0    = 1
  | otherwise = n * factorial (n - 1)

-- Example usage
main :: IO ()
main = do
  putStrLn "Enter a number to compute its factorial:"
  input <- getLine
  let num = read input :: Integer
  let result = factorial num
  putStrLn $ "Factorial of " ++ show num ++ " is " ++ show result