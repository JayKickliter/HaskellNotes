module DSP where

import qualified Data.Vector.Unboxed as U

π = pi

sinpi :: Floating a => a -> a
sinpi x = sin $ π * x 

sinc :: (RealFloat a) => a -> a
sinc x = case x of
  0 -> 1
  _ -> sinpi x / (π*x)


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

epsilon :: RealFloat a => a
epsilon = encodeFloat 1 (fromIntegral $ 1-floatDigits epsilon)

firPrototype :: Double -> Int -> Int -> Double
firPrototype ω len n = ω * sinc(ω * (n' - (len' - 1) / 2))
  where
    n' = fromIntegral n
    len' = fromIntegral len

firPrototype' ω len = [firPrototype ω len n | n <- [0..len-1]]
