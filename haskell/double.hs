module Main where
import Data.List

double alist = alist ++ reverse alist

main = do
    print (double [1, 2, 3])
    print (double [1, 2, 3, 4])
