# Il seguente makefile serve per compilare tutto il progetto velocemente, senza dover
# tutte le volte riscrivere i comani.
#
# La cartella dove vengono salvati tutti i file temporanei è build
#
# Genera un file chiamato "Analisi.pdf" che è il file completo e finale.
#
# CI SONO DUE TIPI DI REGOLE DI COMPILAZIONE:
# 	1) make mod{MODULO} -> Compila il file "Analisi{MODULO}.pdf" e linka tutte le immagini e reference
#
# 	2) make fast{MODULO} -> Non linka nulla, ma permette una compilazione più veloce. Compila il file "Analisi{MODULO}_fast.pdf".
#
# 	- Si consiglia di usare "make fast{MODULO}" per velocizzare il processo mentre si sta modificando
# 	il file, mentre si consiglia di usare "make mod{MODULO}" per buildare il file finale con tutte
# 	le reference del caso
#
#	- "make all" compila sia il modulo 1 che il 2
#

MAIN_1 = src/modulo1/tex/main.tex
MAIN_2 = src/modulo2/tex/main.tex

# I PERCORSI SONO RELATIVI AL FILE MAIN. Non so esattamente come risolvere la cosa :).
BUILD = ../../../build
OUTPUT = $(BUILD)/output

TEX_SRC_1 = $(MAIN_1) src/modulo1/tex/settings.tex $(shell find src/modulo1/tex/sections/*.tex)
IMG_1 = $(shell find src/modulo1/img/*)


TEX_SRC_2 = $(MAIN_2) src/modulo2/tex/settings.tex $(shell find src/modulo2/tex/sections/*.tex)
IMG_2 = $(shell find src/modulo2/img/*)

# ---------------- PRIMO TIPO DI REGOLA ----------------- #

all: mod

mod: mod1 mod2

mod1: Analisi1.pdf

mod2: Analisi2.pdf

Analisi1.pdf: $(TEX_SRC_1) $(IMG_1)
	mkdir -p build/modulo1/sections 	#latexmk non sa creare cartelle da solo 
	latexmk -pdf -cd -emulate-aux-dir -auxdir=$(BUILD)/modulo1 -outdir=$(OUTPUT)/modulo1 $(MAIN_1)
	mv build/output/modulo1/main.pdf Analisi1.pdf

Analisi2.pdf: $(TEX_SRC_2) $(IMG_2)
	mkdir -p build/modulo2/sections 	#latexmk non sa creare cartelle da solo 
	latexmk -pdf -cd -emulate-aux-dir -auxdir=$(BUILD)/modulo2 -outdir=$(OUTPUT)/modulo2 $(MAIN_2)
	mv build/output/modulo2/main.pdf Analisi2.pdf

# ---------------- SECONDO TIPO DI REGOLA ----------------- #

fast: fast1 fast2

fast1: Analisi1_fast.pdf 

fast2: Analisi2_fast.pdf

Analisi1_fast.pdf: $(TEX_SRC_1) $(IMG_1)
	mkdir -p build/modulo1_fast/sections		#pdflatex non sa creare cartelle da solo 
	cd src/modulo1/tex; pdflatex -output-directory=$(BUILD)/modulo1_fast main.tex #MI TOCCA ENTRARE NELLA CARTELLA
	mv build/modulo1_fast/main.pdf Analisi1_fast.pdf


Analisi2_fast.pdf: $(TEX_SRC_2) $(IMG_2)
	mkdir -p build/modulo2_fast/sections		#pdflatex non sa creare cartelle da solo 
	cd src/modulo2/tex; pdflatex -output-directory=$(BUILD)/modulo2_fast main.tex #MI TOCCA ENTRARE NELLA CARTELLA
	mv build/modulo2_fast/main.pdf Analisi2_fast.pdf

clean: clean1 clean2 cleanBuild

clean1:
	rm -rf Analisi1.pdf Analisi1_fast.pdf
	rm -rf build/modulo1 build/modulo1_fast
	rm -rf build/output/modulo1

clean2:
	rm -rf Analisi2.pdf Analisi2_fast.pdf
	rm -rf build/modulo2 build/modulo2_fast
	rm -rf build/output/modulo2

cleanBuild:
	rm -rf build/*
	touch build/.gitkeep	

.PHONY: all mod mod1 mod2 fast fast1 fast2 clean clean1 clean2 cleanBuild
