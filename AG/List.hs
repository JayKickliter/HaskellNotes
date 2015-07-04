module List (main) where

data List a = Nil | Node a (List a)
    deriving Show


elements :: List Int
elements = Node 1 (Node 2 (Node 3 Nil))

main = print elements