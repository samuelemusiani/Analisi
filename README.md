
# Analisi

## Informatica - University of Bolgona - 2022/2023 
All of my notes written in LaTeX for the firt part of the calculus course

## Building from source
Assumendo che tutti i plugin richiesti siano installati:
```
make
```
Viene creato un file dal nome **Analisi.pdf** nella cartella corrente del progetto.

Se si vuole invece compilare più velocemente una versione del pdf, senza però le reference risolte:
```
make fast
```
In questo caso, per distinguere l'output dal comando 'make', viene creato un file dal nome **Analisi_fast.pdf**.

Quando si vogliono eliminare tutti i file creati: 
```
make clean
```
Si noti che questo comando genera un file `.gitkeep` all'interno della cartella build in modo che git non la scarti in quanto vuota.

## Structure
La direcotry `build/` viene usata per tutti i file temporanei che servono a latex per compilare il pdf finale

La directory `src/` contiene tutte le sorgenti tex e le immagini usate.

## Dependencies
Per compilare con il comando `make` è necessario aver installato `latexmk`, mentre per fare la compilazione veloce con il comando `make fast` è necessario aver installato `pdflatex`.

Per i pacchetti necessari a LaTex in quanto inclusi e usati nel progetto è invece necessario consultare il file
```
src/tex/preface.tex
```
