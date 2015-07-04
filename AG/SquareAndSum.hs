module SquareAndSum (main) where
    
mymap :: (a -> b) -> [a] -> [b]
mymap _ []     = []
mymap f (x:xs) = f x : mymap f xs

myfoldl :: (a -> b -> a) -> a -> [b] -> a
myfoldl _ a []     = a
myfoldl f a (x:xs) = myfoldl f (f a x) xs

mysum :: [Int] -> Int
mysum = myfoldl (+) 0

ints :: [Int]
ints = [1..5]

square :: Int -> Int
square a = a*a

squares :: [Int]
squares = mymap square ints

total :: Int
total = mysum squares

main = print total