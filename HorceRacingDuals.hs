import Data.List

main :: IO ()
main = interact $ \s ->
  let vals = sort . fmap (read :: String -> Int) . lines $ s in
    show . minimum . zipWith subtract vals $ tail vals
 
