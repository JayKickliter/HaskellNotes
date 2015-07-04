-- SecondType.hs

module SecondType (main) where

data SecondType = SecondType Int String Char

makeValue :: Int -> SecondType
makeValue integer = SecondType integer "Scuzzlebutt" 'X'

main = case makeValue 3 of
    SecondType _ string _ -> print string
