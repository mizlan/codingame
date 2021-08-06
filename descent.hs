import Data.Ord
import Data.List
import Control.Monad
import System.IO

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering -- DO NOT REMOVE
    forever $ do
        a <- replicateM 8 $ read <$> getLine :: IO [Int]
        hPrint stderr a
        print $ maximumBy (comparing (a !!)) [0..7]
