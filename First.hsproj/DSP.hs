module DSP where

import qualified Data.Vector.Unboxed as U

hamming :: Int -> Int -> Double
hamming n len = 0.54 - 0.46 * cos((2 * pi * n') / (len' - 1))
  where
    n'   = fromIntegral n
    len' = fromIntegral len


hamming' :: Int -> [Double]
hamming' n = [0.54 - 0.46 * cos((2 * pi * n') / m) | n' <- [0..m]]
  where
    m =  fromIntegral (n - 1)


hamming'' :: Int -> U.Vector Double
hamming'' len = U.generate len go
  where
    go = \x -> hamming x len

dotp :: (U.Unbox a, Num a) => U.Vector a -> U.Vector a -> a
dotp v w = U.sum $ U.zipWith (*) v w


