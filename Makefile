# Funkcionalny projket z predmetu FLP
# Varianta: rv-2-rka
# Autor: Frantisek Matecny, xmatec00
# Datum: 1.4.2017

all:
	ghc --make rv-2-rka.hs

clean:
	rm -rf rv-2-rka *.hi *.o
	rm -rf Types/*.hi Types/*.o
	rm -rf Parser/*.hi Parser/*.o
	rm -rf Functions/*.hi Functions/*.o