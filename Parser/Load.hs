-- Funkcionalny projket z predmetu FLP
-- Varianta: rv-2-rka
-- Autor: Frantisek Matecny, xmatec00
-- Datum: 1.4.2017

module Parser.Load where

import System.Directory  

-- Nacitanie riadku zo suboru --
getLineFromFile :: Bool -> FilePath -> IO String
getLineFromFile True f = do
    line <- readFile f
    return $ id line
getLineFromFile False f = do 
    error "Subor neexistuje"

-- Nacitanie riadku zo stdin alebo suboru --    
getMyLine :: FilePath -> IO String 
getMyLine [] = do
    line <- getLine 
    return $ id line 
getMyLine f = do
    fileExist <- doesFileExist f
    getLineFromFile fileExist f