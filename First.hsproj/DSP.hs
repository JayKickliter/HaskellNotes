module DSP where

import qualified Data.Vector.Unboxed as U

-- | sinpi x == sin πx
sinpi :: Floating a => a -> a
sinpi x = sin $ pi * x

-- | sinc x == (sin πx)/πx
sinc :: (RealFloat a) => a -> a
sinc x = case x of
  0 -> 1
  _ -> sinpi x / (pi*x)

-- | Computes dot product of two vectors
dotp :: (U.Unbox a, Num a) => U.Vector a -> U.Vector a -> a
dotp v w = U.sum $ U.zipWith (*) v w


-- | Computes Hamming window values
hamming' :: Int -> Int -> Double
hamming' len n = 0.54 - 0.46 * cos((2 * pi * n') / (len' - 1))
  where
    n'   = fromIntegral n
    len' = fromIntegral len

-- | Creates a Hamming window vector
hamming :: Int -> U.Vector Double
hamming len = U.generate len $ hamming' len



-- | Computes FIR filter prototype values
prototype' :: (RealFloat a) => a -> Int -> Int -> a
prototype' ω len n = ω * sinc(ω * (n' - (len' - 1) / 2))
  where
    n' = fromIntegral n
    len' = fromIntegral len

-- | Creates a prototype FIR filter vector
prototype :: (U.Unbox a, RealFloat a) => a -> Int -> U.Vector a
prototype ω len = U.generate len go
  where
    go = \x -> prototype' ω len x


-- | Create windowed taps
--taps :: (Int a, RealFloat b) => b -> (b -> a -> a -> b) -> U.Vector b
taps ω len winFun = U.generate len go where
  go = (prototype' ω len) . (winFun len)

add :: (Num a, U.Unbox a) => U.Vector a -> U.Vector a -> U.Vector a
add = U.zipWith (Prelude.+)
