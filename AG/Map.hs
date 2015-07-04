module Map (main) where
    
mymap :: (a -> b) -> [a] -> [b]
mymap _ [] = []
mymap f (x:xs) = f x : mymap f xs


ints :: [Int]
ints = [1..5]

square :: Int -> Int
square a = a * a

main = print (mymap square ints)