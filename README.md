Funkcionálny projket z predmetu FLP
Varianta: rv-2-rka
Prevod regulárneho výrazu na rozšírený konečný automat
 
Autor: František Matečný, xmatec00
Datum: 1.4.2017

===== Rozdelenie projektu: =====
Makefile
rv-2-rka.hs

Functions/
	Funct.hs
	
Parser/
	EFSM.hs
	Load.hs
	RE.hs
	Tree.hs
	
Types/
	Type.hs	

rv-2-rka.hs - hlavný program - spracovanie argumentov, vytvorenie a výpis RV a RKA
Funct.hs	- pomocné funkcie
Type.hs  	- vlastný typ stromu a RKA
Load.hs  	- načítanie vstupu zo stdin alebo súboru
Tree.hs		- prevod regulárneho výrazu na strom
RE.hs		- prevod stromu na regulárny výraz v postfixe alebo infixe
EFSM.hs  	- prevod stromu na pravidla RKA (číslo štartovacieho stavu je možné zmeniť)


===== Popis: =====
Vstupom programu je regulárny výraz, ktorý je prevedný na strom a následne na RKA.
Pri postupnom prevode zo stromu na RKA vždy vznikne len jeden koncový stav označný najväčším číslom.

! emptyInput !
Pri prazdnom vstupe je na stdin vypísaný prázdny riadok.
Ak uvazujeme ze prazdny RV je RKA s jednym stavom a epsilon prechodom je toto možné docieliť nahradením príkazu
"newLine" za príkaz "emptyInput" v súbore rv-2-rka.hs vo funkcii "procEFSM".


===== Kompilácia: =====
make

===== Spustenie: =====
rv-2-rka (-r|-t) [file]

===== Zmazanie: =====
make clean
