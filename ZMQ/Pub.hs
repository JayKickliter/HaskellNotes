{-# LANGUAGE OverloadedStrings #-}
import Control.Applicative
import Control.Monad
import Data.Monoid
import Data.String
import System.IO
import System.Exit
import System.Environment
import System.ZMQ3.Monadic
import qualified Data.ByteString.Char8 as BS

main :: IO ()
main = do
    args <- getArgs
    when (length args /= 2) $ do
        hPutStrLn stderr "usage: prompt <address> <username>"
        exitFailure
    let addr = head args
        name = fromString (args !! 1) <> ": "
    runZMQ $ do
        pub <- socket Pub
        bind pub addr
        forever $ do
            line <- liftIO $ BS.pack <$> getLine
            send pub [] (name <> line)