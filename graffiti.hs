import           Control.Monad
import           Data.List

readInt = read :: String -> Int
readIntList = fmap readInt . words

showTuple :: Show a => (a, a) -> String
showTuple (a, b) = show a ++ " " ++ show b

showOutput :: [(Int, Int)] -> String
showOutput l = if null l then "All painted" else unlines . fmap showTuple $ l

data Event = Start | End
  deriving (Show, Eq, Ord)

isStart Start = True
isStart _     = False

events :: [[Int]] -> [(Int, Event)]
events l = sort $ join $ do
  [s, e] <- l
  pure [(s, Start), (e, End)]

solve :: [(Int, Event)] -> Int -> Int -> [(Int, Int)]
solve [] _ _ = []
solve (x : xs) time level =
  let a = if level == 0 && time < fst x then [(time, fst x)] else []
  in  a ++ solve xs (fst x) (adjustLevel (snd x) level)
  where adjustLevel Start x = x + 1
        adjustLevel End   x = x - 1

main :: IO ()
main = do
  l <- readInt <$> getLine
  n <- readInt <$> getLine
  a <- replicateM n (readIntList <$> getLine)
  putStr . showOutput $ solve (events (a ++ [[l, l]])) 0 0
