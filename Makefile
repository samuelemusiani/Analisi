all: mod

mod: mod1 mod2

mod1:
	cd modulo1; ./build.sh
mod2:
	cd modulo2; ./build.sh

clean: clean1 clean2

clean1:
	rm -rf Analisi1.pdf
	rm -rf modulo1/build

clean2:
	rm -rf Analisi2.pdf
	rm -rf modulo2/build

.PHONY: all mod mod1 mod2 clean clean1 clean2
