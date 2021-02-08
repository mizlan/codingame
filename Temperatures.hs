-- |Solved.

import System.IO
import Control.Monad
import Data.List
import Data.Maybe
import Data.Ord

readI = read :: String -> Int

readL :: String -> [Int]
readL = map read . words

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    n <- readI <$> getLine
    xs <- readL <$> getLine
    putStrLn $ maybe "0" show $ listToMaybe $ sortOn abs $ sortOn (Down . signum) xs
