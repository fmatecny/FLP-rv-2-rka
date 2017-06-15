-- Funkcionalny projket z predmetu FLP
-- Varianta: rv-2-rka
-- Autor: Frantisek Matecny, xmatec00
-- Datum: 1.4.2017

module Types.Type where

data Tree = Symbol Char | Op Char Tree Tree | EmptyTree deriving Show  

type EFSMachine = (States, StartState, EndStates, Rules)
type States = [Int]
type StartState = Int
type EndStates = Int
type Rules = [(Int, Char, Int)]

