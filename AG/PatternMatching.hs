-- PatternMatching.hs

module PatternMatching (main) where

fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

z = fib 10

match :: String -> String -> String
match "Fart" "Face"    = "FartFace"
match "Fluffy" "pants" = "Hello Colonel Fluffypants" 
match "Mr." y = "Hello Mr. "  ++ " " ++ y
match x _ = "Hello " ++ x

ff = match "Fart" "Face"
fp = match "Fluffy" "pants"
f2 = match "Raul" ""


main = print (z, ff, fp, f2) :: IO ()
