-- Function.hs

module Function(main) where
    
timesThree :: Int -> Int
timesThree x = x * 3

sayHello :: String -> String
sayHello target = "Hello, " ++ target ++ "!"


add :: Int -> Int -> Int
add x y = x + y

-- Under the covers, the add function looks like:
-- add :: Int -> (Int -> Int)
-- add = \first -> \second -> first + second

z = add 1 2

main = print (timesThree 3, sayHello "Colonel Fluffypants", z) :: IO ()
