
# Analisi

## Informatica - University of Bolgona - 2022/2023 
All of my notes written in LaTeX for the calculus course

## Building from source
Assumendo che tutti i plugin richiesti siano installati:
```
make
```
Vengono creati due file nome **Analisi1.pdf** e **Analisi2.pdf** nella cartella corrente del progetto. Il primo corrisponde al *primo modulo (1)*, mentre il secondo al *secondo modulo (2)*

Se si vuole invece compilare più velocemente una versione del pdf, senza però le reference risolte:
```
make fast
```
In questo caso, per distinguere l'output dal comando 'make', vengono creati due file dal nome **Analisi_fast1.pdf** e **Analisi_fast2.pdf**.

Quando si vogliono eliminare tutti i file creati: 
```
make clean
```
Si noti che questo comando genera un file `.gitkeep` all'interno della cartella build in modo che git non la scarti in quanto vuota.

È possibile anche essere più precisi e compilare o eliminare un solo modulo alla volta. In questo caso basta indicare il numero del modulo subito dopo il comando:

```
make mod{numeroModulo}

make fast{numeroModulo}

make clean{numeroModulo}
```
Cioè se per esempio voglio compilare velocemente solo il secondo modulo scriverò 'make fast2'

## Structure
La direcotry `build/` viene usata per tutti i file temporanei che servono a latex per compilare il pdf finale

La directory `src/` contiene tutte le sorgenti tex e le immagini usate rispettivamente nella cartella del modulo.

## Dependencies
Per compilare con il comando `make` è necessario aver installato `latexmk`, mentre per fare la compilazione veloce con il comando `make fast` è necessario aver installato `pdflatex`.

Per i pacchetti necessari a LaTex in quanto inclusi e usati nel progetto è invece necessario consultare i files
```
src/modulo1/tex/settings.tex

src/modulo2/tex/settings.tex
```
