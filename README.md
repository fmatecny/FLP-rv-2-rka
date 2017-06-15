Funkcionálny projket z predmetu FLP <br />
Varianta: rv-2-rka <br />
Prevod regulárneho výrazu na rozšírený konečný automat <br />
Autor: František Matečný, xmatec00 <br />
Datum: 1.4.2017

===== Rozdelenie projektu: ===== <br />
Makefile <br />
rv-2-rka.hs

Functions/ <br />
&emsp;&emsp; Funct.hs
	
Parser/ <br />
&emsp;&emsp; EFSM.hs <br />
&emsp;&emsp; Load.hs <br />
&emsp;&emsp; RE.hs <br />
&emsp;&emsp; Tree.hs
	
Types/ <br />
&emsp;&emsp; Type.hs	

rv-2-rka.hs - hlavný program - spracovanie argumentov, vytvorenie a výpis RV a RKA <br />
Funct.hs	- pomocné funkcie <br />
Type.hs  	- vlastný typ stromu a RKA <br />
Load.hs  	- načítanie vstupu zo stdin alebo súboru <br />
Tree.hs		- prevod regulárneho výrazu na strom <br />
RE.hs		- prevod stromu na regulárny výraz v postfixe alebo infixe <br />
EFSM.hs  	- prevod stromu na pravidla RKA (číslo štartovacieho stavu je možné zmeniť)


===== Popis: ===== <br />
Vstupom programu je regulárny výraz, ktorý je prevedný na strom a následne na RKA. <br />
Pri postupnom prevode zo stromu na RKA vždy vznikne len jeden koncový stav označný najväčším číslom.

! emptyInput ! <br />
Pri prazdnom vstupe je na stdin vypísaný prázdny riadok. <br />
Ak uvazujeme ze prazdny RV je RKA s jednym stavom a epsilon prechodom je toto možné docieliť nahradením príkazu
"newLine" za príkaz "emptyInput" v súbore rv-2-rka.hs vo funkcii "procEFSM".


===== Kompilácia: ===== <br />
make

===== Spustenie: ===== <br />
rv-2-rka (-r|-t) [file]

===== Zmazanie: ===== <br />
make clean
