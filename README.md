
# Analisi

## Informatica - University of Bolgona - 2022/2023 
All of my notes written in LaTeX for the calculus course

## Building from source
Assumendo che `tectonic` sia installato:
```
$ make
```
Vengono creati due file nome **Analisi1.pdf** e **Analisi2.pdf** nella cartella corrente del progetto. Il primo corrisponde al *primo modulo (1)*, mentre il secondo al *secondo modulo (2)*

Quando si vogliono eliminare tutti i file creati: 
```
$ make clean
```
È possibile anche essere più precisi e compilare o eliminare un solo modulo alla volta. In questo caso basta indicare il numero del modulo subito dopo il comando:

```
$ make mod{numeroModulo}

$ make clean{numeroModulo}
```
Cioè se per esempio voglio compilare solo il secondo modulo scriverò `$ make mod2`
