-- Funkcionalny projket z predmetu FLP
-- Varianta: rv-2-rka
-- Autor: Frantisek Matecny, xmatec00
-- Datum: 1.4.2017

module Parser.RE where

import Types.Type

-- prevod stromu regularneho vyrazu na infix --
parseTreeToInfix :: Tree -> [Char]
parseTreeToInfix (Op f l r)
    | f == '.' = parseTreeToInfix l ++ parseTreeToInfix r
    | f == '+' = "(" ++ parseTreeToInfix l ++ (f:[]) ++ parseTreeToInfix r ++ ")"
    | f == '*' = parseTreeToInfix l ++ (f:[])
parseTreeToInfix (Symbol c) = c:[]
parseTreeToInfix _ = error "parseTreeToInfix - chybny vstup"

-- prevod stromu regularneho vyrazu na postfix --
parseTreeToPostfix :: Tree -> [Char]
parseTreeToPostfix (Op f l r)
    | f == '.' = parseTreeToPostfix l ++ parseTreeToPostfix r ++ (f:[])
    | f == '+' = parseTreeToPostfix l ++ parseTreeToPostfix r ++ (f:[])
    | f == '*' = parseTreeToPostfix l ++ (f:[])
parseTreeToPostfix (Symbol c) = c:[]
parseTreeToPostfix _ = error "parseTreeToPostfix - chybny vstup"