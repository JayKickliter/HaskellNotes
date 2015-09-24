{-# LANGUAGE OverloadedStrings #-}

module Cats where

import Data.Word
import Data.Serialize
import Control.Monad
import Data.ByteString (ByteString)
import Control.Applicative

import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BC

catNameLength :: Int
catNameLength = 20

data Cat = Cat { name :: String, weight :: Float }
  deriving (Show)

instance Serialize Cat where
  put cat = do
    putByteString (encCatName (name cat))
    putFloat32le (weight cat)

  get = Cat <$> liftM stripTrailingZeros (getByteString catNameLength) <*> getFloat32le

encCatName :: String -> ByteString
encCatName n = BC.pack $ n' ++ take (catNameLength - length n') z
  where
    n' = take (catNameLength - 1) n
    z  = replicate catNameLength '\0'

-- | Strip trailing NULLs from ByteString
stripTrailingZeros :: ByteString -> String
stripTrailingZeros = BC.unpack . (BS.takeWhile (> 0))

justCat :: Either String Cat -> Cat
justCat cat = case cat of
  Right cat -> cat
  Left cat -> Cat "" 0

main = do
  let izzy = Cat "Izzy" 8.7
  writeCatToFile izzy



writeCatToFile :: Cat -> IO ()
writeCatToFile cat = do
  BS.writeFile ("/Users/jay/" ++ (name cat) ++ ".txt") (encode cat)


--readCatFromFile :: String -> IO ()
readCatFromFile fileName = do
  cat <- BS.readFile fileName
  justCat (decode cat)
 