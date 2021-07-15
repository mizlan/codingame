main = interact $ \s -> let n = read s :: Int in
  show . (+1) . length . takeWhile (< n) . scanl1 (+) $ [1..]
