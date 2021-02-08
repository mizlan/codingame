-- |Solved.

import Data.List (tails)
import System.IO (BufferMode (NoBuffering), hSetBuffering, stdout)

readI = read :: String -> Int

readL :: String -> [Int]
readL = map read . words

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  [w, h, _, _] <- readL <$> getLine
  xs <- readL <$> getLine
  ys <- readL <$> getLine
  xs <- return $ [0] ++ xs ++ [w]
  ys <- return $ [0] ++ ys ++ [h]
  let xw = [b - a | (a : as) <- tails xs, b <- as]
  let yh = [b - a | (a : as) <- tails ys, b <- as]
  print $ length $ [() | x <- xw, y <- yh, x == y]
