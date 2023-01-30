# Il seguente makefile serve per compilare tutto il progetto velocemente, senza dover
# tutte le volte riscrivere i comani.
#
# Genera un file chiamato "Analisi.pdf" che è il file completo e finale.
#
# La cartella dove vengono salvati tutti i file temporanei è build
#

MAIN = src/tex/main.tex

# I PERCORSI SONO RELATIVI AL FILE MAIN. Non so esattamente come risolvere la cosa :)
BUILD = ../../build
OUTPUT = $(BUILD)/output

TEX_SRC = $(MAIN) src/tex/preface.tex $(shell find src/tex/sections/*.tex)
IMG = $(shell find src/img/*)

all: Analisi.pdf

Analisi.pdf: $(TEX_SRC) $(IMG)
	latexmk -pdf -cd -emulate-aux-dir -auxdir=$(BUILD) -outdir=$(OUTPUT) $(MAIN)
	mv build/output/main.pdf Analisi.pdf

clean:
	rm -rf build/*

.PHONY: clean all
