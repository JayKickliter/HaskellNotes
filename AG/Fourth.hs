-- Fourth.hs

three = one + two
    where
        one = 1
        two = 2
        
seven = 
    let three = 3 :: Float
        four  = 4 :: Float
    in three + four        
        
eight = let {x = 5 :: Int; y = 3 :: Int} in x + y 
        
main = print (three, seven, eight) :: IO ()
        