module QuickSort where
  
{-# LANGUAGE OverloadedStrings #-}
--import Control.Applicative
--import Control.Monad
import Data.Monoid
import Data.String
--import System.IO
--import System.Exit
--import System.Environment
--import qualified Data.ByteString.Char8 as BS

quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted  
