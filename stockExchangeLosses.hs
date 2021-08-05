import Data.Set (Set)
import qualified Data.Set as S
import Data.Maybe (fromJust)

readI = read :: String -> Int

solve :: Set Int -> [Int] -> Int
solve s [] = 0
solve s (x:xs)
  | S.null s  = solve (S.singleton x) xs
  | otherwise = min (x - fromJust (S.lookupMax s)) $
      solve (S.insert x s) xs

main = interact $ \s -> let nums = readI <$> (words (lines s !! 1)) in
  show $ solve S.empty nums
