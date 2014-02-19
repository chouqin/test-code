module Main where
import Data.List

permutation alist = permutations alist

main = do
    print (permutation [1, 2, 3])
    print (permutation [1, 2, 3, 4])
