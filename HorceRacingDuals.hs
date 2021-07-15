import Data.List

main :: IO ()
main = interact $ \s ->
  let vals = sort . tail . fmap (read :: String -> Integer) . lines $ s in
    show . minimum . zipWith subtract vals $ tail vals
 
