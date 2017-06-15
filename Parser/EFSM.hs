-- Funkcionalny projket z predmetu FLP
-- Varianta: rv-2-rka
-- Autor: Frantisek Matecny, xmatec00
-- Datum: 1.4.2017

module Parser.EFSM where

import Types.Type
import Functions.Funct

import Data.List  


-- cislovanie stavov od 1 - je mozne zmenit
startNum = 1

-- vytvorenie RKA --
createEFSM :: Tree -> EFSMachine
createEFSM t = (nub $ sort states,
               startNum,
               maximum states,
               rules)
               where rules = sort $ parseTreeToRules t startNum
                     states = getState rules

-- prevod stromu na pravidla RKA --
parseTreeToRules :: Tree -> Int -> Rules
parseTreeToRules (Op f (Symbol l) (Symbol r)) n
    | f == '.' = (n,l,(n+1)):((n+1),r,(n+2)):[]
    | f == '+' = (n,' ',(n+1)):(n,' ',(n+3)):((n+1),l,(n+2)):((n+3),r,(n+4)):((n+2),' ',(n+5)):((n+4),' ',(n+5)):[]
    | otherwise = error "Chybny regularny vyraz"
parseTreeToRules (Op f (Symbol l) r) n
    | f == '.' = (n,l,(n+1)):(foldr (:) (parseTreeToRules r (n+1)) [])
    | f == '+' = (n,' ',(n+1)):(n,' ',(n+3)):((n+1),l,(n+2)):((n+2),' ',m):((m-1),' ',m):(foldr (:) (parseTreeToRules r (n+3)) [])
    | f == '*' = (n,' ',(n+1)):((n+1),l,(n+2)):((n+2),' ',(n+1)):((n+2),' ',(n+3)):(n,' ',(n+3)):[]
    | otherwise = error "Chybny regularny vyraz"
    where m = lengthTree r + (n+3)
parseTreeToRules (Op f l (Symbol r)) n
    | f == '.' = foldr (:) [(m,r,(m+1))] (foldr (:) (parseTreeToRules l n) [])
    | f == '+' = (n,' ',(n+1)):(n,' ',(mm-2)):((mm-2),r,(mm-1)):((mm-1),' ',mm):((mm-3),' ',mm):(foldr (:) (parseTreeToRules l (n+1)) [])
    | otherwise = error "Chybny regularny vyraz"
    where m = lengthTree l + n - 1
          mm = lengthTree l + (n+1) + 2
parseTreeToRules (Op f l r) n
    | f == '.' = foldr (:) (parseTreeToRules r (m1-2)) (parseTreeToRules l n)
    | f == '+' = (n,' ',(n+1)):(n,' ',m1):((m1-1),' ',m2):((m2-1),' ',m2):(foldr (:) (parseTreeToRules l (n+1)) (parseTreeToRules r m1))
    | f == '*' = (n,' ',(n+1)):(n,' ',m1):((m1-1),' ',(n+1)):((m1-1),' ',m1):(foldr (:) (parseTreeToRules l (n+1)) [])
    | otherwise = error "Chybny regularny vyraz"
    where m1 = lengthTree l + (n+1)
          m2 = lengthTree r + m1
parseTreeToRules (Symbol s) n =  (n,s,(n+1)):[]
parseTreeToRules _ _ = error "Chybny regularny vyraz"


-- vypocet poctu stavov v strome --
lengthTree :: Tree -> Int
lengthTree (Op f (Symbol l) (Symbol r))
    | f == '.' = 3
    | f == '+' = 6
lengthTree (Op f (Symbol l) r)
    | f == '.' = 1 + lengthTree r
    | f == '+' = 4 + lengthTree r
    | f == '*' = 4
lengthTree (Op f l (Symbol r))
    | f == '.' = 1 + lengthTree l
    | f == '+' = 4 + lengthTree l
lengthTree (Op f l r)
    | f == '.' = lengthTree l + lengthTree r - 1
    | f == '+' = lengthTree l + lengthTree r + 2
    | f == '*' = lengthTree l + 2
lengthTree _ = error "Chybny strom"
