all: mod

mod: mod1 mod2

mod1:
	cd modulo1; tectonic -X build
	mv modulo1/build/Analisi1/Analisi1.pdf ./
mod2:
	cd modulo2; tectonic -X build
	mv modulo2/build/Analisi2/Analisi2.pdf ./

clean: clean1 clean2

clean1:
	rm -rf Analisi1.pdf
	rm -rf modulo1/build

clean2:
	rm -rf Analisi2.pdf
	rm -rf modulo2/build

.PHONY: all mod mod1 mod2 clean clean1 clean2
