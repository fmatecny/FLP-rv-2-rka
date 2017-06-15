-- Funkcionalny projket z predmetu FLP
-- Varianta: rv-2-rka
-- Autor: Frantisek Matecny, xmatec00
-- Datum: 1.4.2017

import System.Environment   
import System.Directory  
import System.IO  
import Data.List  

import Types.Type
import Parser.Load
import Parser.Tree
import Parser.EFSM
import Parser.RE
  
newLine = putStrLn ""

-- vid README --
-- ak uvazujeme ze prazdny RV je RKA s jednym stavom a epsilon prechodom --
emptyInput = putStrLn "1\n1\n1\n1,,1"   

   
main = do  
    args <- getArgs
    let (action, file) = procArgs args
    line <- getMyLine file
    action line

-- Spracovanie argumentov --
procArgs :: [String] -> (String -> IO (), [Char])
procArgs [] = error "Zle argumenty"
procArgs [x]
    | x=="-r" = (procRE, [])
    | x=="-t" = (procEFSM, [])
    | otherwise = error "Neznamy argument"
procArgs [x,y]
    | x=="-r" = (procRE, y)
    | x=="-t" = (procEFSM, y)
    | otherwise = error "Neznamy argument"
procArgs _ = error "Zle argumenty"



--------- hlavna procedura - regularny vyraz -------------  
procRE :: String -> IO () 
procRE [] = do
    newLine
procRE line = do
    let myTree = parseREtoTree line
    putStrLn (id (parseTreeToPostfix myTree))
    --putStrLn (id (parseTreeToInfix myTree))
    --putStrLn (show myTree)

---------- hlavna procedura - rozsireny konecny automat  ----------
procEFSM :: String -> IO ()
procEFSM [] = do
    newLine
    -- vid README
    -- emptyInput
procEFSM line = do  
    let myTree = parseREtoTree line
    let myEFSM = createEFSM myTree
    printEFSM myEFSM





-- vypis pravidiel --
printRules :: (Int, Char, Int) -> String
printRules (a, b, c)
    | b == ' ' = (show a) ++ ",," ++ (show c)
    | otherwise = (show a) ++ "," ++ (b:[]) ++ "," ++ (show c)

-- vypis RKA --
printEFSM (a, b, c, d) = do
   putStrLn (intercalate "," . map show $ a)
   putStrLn (show b)
   putStrLn (show c)
   mapM_ (putStrLn . printRules) d
