-- Funkcionalny projket z predmetu FLP
-- Varianta: rv-2-rka
-- Autor: Frantisek Matecny, xmatec00
-- Datum: 1.4.2017

module Functions.Funct where

import Types.Type


-- prvy v trojici --
getFst :: (Int, Char, Int) -> Int
getFst (x, _, _) = x

-- posledny v trojici --
getThrd :: (Int, Char, Int) -> Int
getThrd (_, _, x) = x

-- vyjme stavy z pravidiel --
getState :: Rules -> States
getState [] = []
getState (x:xs) = getFst x : getThrd x : getState xs