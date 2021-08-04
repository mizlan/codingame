import System.IO
import Control.Monad
import Data.Map (Map)
import Data.List (foldl')
import qualified Data.Map as M

data Trie = Empty | Node (Map Char Trie)
  deriving Show

singleton :: String -> Trie
singleton "" = Empty
singleton (x:xs) = Node (M.fromList [(x, singleton xs)])

insert :: Trie -> String -> Trie
insert Empty s = singleton s
insert t "" = t
insert (Node m) (x:xs)
  | x `M.member` m = Node $ M.insert x (insert (m M.! x) xs) m
  | otherwise      = Node $ M.insert x (singleton xs) m

fromList :: [String] -> Trie
fromList = foldl' insert Empty

size :: Trie -> Int
size Empty = 0
size (Node m) = M.size m + sum (size <$> m)

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    n <- (read <$> getLine) :: IO Int
    a <- replicateM n getLine    
    print . size . fromList $ a
