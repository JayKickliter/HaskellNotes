-- MyType.hs

module MyType (main) where

data MyType = Constructor Int
    deriving Show

makeValue :: Int -> MyType
makeValue integer = Constructor integer

incValue :: MyType -> MyType
incValue (Constructor integer) = Constructor (integer + 1)

main = print value2
    where
        value1 = makeValue 3
        value2 = incValue value1