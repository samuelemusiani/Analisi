# Il seguente makefile serve per compilare tutto il progetto velocemente, senza dover
# tutte le volte riscrivere i comani.
#
# Genera un file chiamato "Analisi.pdf" che è il file completo e finale.
#
# La cartella dove vengono salvati tutti i file temporanei è build
#
# CI SONO DUE REGOLE DI COMPILAZIONE:
# 	1) make all -> Costruisce il file "Analisi.pdf" e linka tutte le immagini e reference
#
# 	2) make fast -> Non linka nulla, ma permette una compilazione più veloce.
#
# 	- Si consiglia di usare "make fast" per velocizzare il processo mentre si sta modificando
# 	il file, mentre si consiglia di usare "make all" per buildare il file finale con tutte
# 	le reference del caso
#

MAIN = src/tex/main.tex

# I PERCORSI SONO RELATIVI AL FILE MAIN. Non so esattamente come risolvere la cosa :)
BUILD = ../../build
OUTPUT = $(BUILD)/output

TEX_SRC = $(MAIN) src/tex/preface.tex $(shell find src/tex/sections/*.tex)
IMG = $(shell find src/img/*)

# ---------------- PRIMA REGOLA ----------------- #

all: Analisi.pdf

Analisi.pdf: $(TEX_SRC) $(IMG)
	mkdir -p build/sections 	#latexmk non sa creare cartelle da solo 
	latexmk -pdf -cd -emulate-aux-dir -auxdir=$(BUILD) -outdir=$(OUTPUT) $(MAIN)
	mv build/output/main.pdf Analisi.pdf

# ---------------- SECONDA REGOLA ----------------- #

fast: Analisi_fast.pdf

Analisi_fast.pdf: $(TEX_SRC) $(IMG)
	mkdir -p build/sections		#pdflatex non sa creare cartelle da solo 
	cd src/tex; pdflatex -output-directory=$(BUILD) main.tex #MI TOCCA ENTRARE NELLA CARTELLA
	mv build/main.pdf Analisi_fast.pdf

clean:
	rm -rf build/*
	touch build/.gitkeep	

.PHONY: clean all
