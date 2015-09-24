
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

dot' :: [Int] -> [Int] -> Int
dot' [] _ = 0
dot' _ [] = 0
dot' x y  = foldl (+) 0 $ zipWith' (*) x y


foldr' f z []     = z
foldr' f z (x:xs) = x `f` foldr f z xs

sum1 = foldr' (+) 0
