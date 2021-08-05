import           Control.Monad
import           Data.List

readInt = read :: String -> Int
readTup s = let [a, b] = readInt <$> words s in (a, b)

median :: [Int] -> Int
median a = let l = length a in
  sort a !! (l `div` 2)

main :: IO ()
main = do
  n <- readInt <$> getLine
  a <- replicateM n (readTup <$> getLine)
  let xs = fst <$> a
  let ys = snd <$> a
  let mainLength = maximum xs - minimum xs
  let m = median ys
  print $ mainLength + sum (abs . subtract m <$> ys)
