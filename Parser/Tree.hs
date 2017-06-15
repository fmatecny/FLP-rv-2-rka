-- Funkcionalny projket z predmetu FLP
-- Varianta: rv-2-rka
-- Autor: Frantisek Matecny, xmatec00
-- Datum: 1.4.2017

module Parser.Tree where

import Types.Type

-- prevod regularneho vyrazu na strom --
-- http://stackoverflow.com/questions/36277160/haskell-reverse-polish-notation-regular-expression-to-expression-tree --
step :: [Tree] -> Char -> [Tree]
step (r:l:s) '.' = (Op '.' l r):s
step (r:l:s) '+' = (Op '+' l r):s
step (l:s) '*'   = (Op '*' l EmptyTree):s
step x '\n'      = x
step s c
    | (c `elem` ['a'..'z']) = (Symbol c):s
    | otherwise = error "Chybny regularny vyraz"

parseREtoTree :: String -> Tree
parseREtoTree x  
    | (',' `elem` (show result)) = error "Chybny regularny vyraz"
    | otherwise = head result
    where result = foldl step [] x