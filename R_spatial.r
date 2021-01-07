#recall package sp
library(sp)
#recall meuse data
data(meuse)
#check data meuse
mesue
head(meuse)
#assegnare coordinate ai dati
#nel pacchetto sp c'è il comando coordinates che permette di dire a R quali valori usare come coordinate
coordinates(meuse) = ~x+y
#in questo modo sarà possibile visualizzare i dati nello spazio
plot(meuse)
#spplot visualizza la distribuzione con più colori
spplot(meuse,"zinc")
#per visualizzare i grafici di diverse variabili insieme, occorre richiamare le variabili dentro un un array ovvero un set di elementi
spplot(meuse, c("zinc", "copper"))

#la funzione bubble permette una visualizzazione tramite cerchi, la cui dimensione è proporzionale al valore numerico che rappresenta
bubble(meuse, "zinc")
