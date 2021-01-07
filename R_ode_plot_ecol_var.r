# you can write anything here, this is a comment
# R code for plotting relationship amnong ecological variables
# la funzione install.packages (occhio alla s finale!) permette l'installazione di pacchetti, richiamandoli da fuori R
#le virgolette servono, appunto, a richiamare cose fuori R
install.packages("sp")
# per utilizzare il pacchetto serve un'altra funzione (argomento senza virgolette):
library(sp)
# nel pacchetto sono disponibili serie di dati che possono essere richiamati con la funzione
data(meuse)
# per visualizzarli, dopo occorre digitare
meuse
#per visualizzarli in forma tabellare c'è la funzione:
View(meuse)
# per visualizzare solo le prime 6 righe del set di dati, funzione
head(meuse)
# esercizio: calcola la media delle variabili del dataset 
summary(meuse)
# esercizio 2: visualizzare la correlazione grafica tra due variabili del dataset: zin(y) cadmium(x)
plot(meuse$cadmium, meuse$zinc)
#oppure la funzione
attach(meuse)
#introduce direttamente i nomi delle variabili del dataset, senza passare per il riferimento al nome del dataset
plot(cadmium, zinc)
# visualizzare la correlazione tra tutte le variabili: Scatterplot Matrices 
pairs(meuse)
# visualizzare la correlazione grafica solo tra alcune variabili
pairs(meuse[,3:6]# in alternativa si possono usare anche i NOMI delle colonne
pairs(~cadmium + copper + lead + zinc, data=meuse)
# ~ corrisponde a = per gruppi, = in R significa is, a volte si utilizzano entrambi allo stesso modo
# NB: di default R fa riferimento alle colonne, per le righe ci sono specifiche funzioni
# esercizio: migliorare il layout dei grafici con diverso colore(rosso), simbolo (triangolo) e dimensione
pairs(~cadmium + copper + lead + zinc, data=meuse, col="red", pch=17,cex=3)





