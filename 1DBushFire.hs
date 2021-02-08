import           System.IO
import           Control.Monad

readI = read :: String -> Int

solve :: [Char] -> Int
solve xs = case dropWhile (== '.') xs of
  []  -> 0
  xs' -> 1 + solve (drop 3 xs')

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  n <- readI <$> getLine
  replicateM_ n $ getLine >>= (print . solve)
