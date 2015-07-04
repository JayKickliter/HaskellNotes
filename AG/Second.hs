-- Second.hs

integer :: Int
integer = 3

str :: String
str = "Hello, World!"

character :: Char
character = 'c'

tuple :: (Int, String, Char)
tuple = (integer, str, character)

main :: IO ()
main = print tuple