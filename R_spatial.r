#recall package sp
library(sp)
#recall meuse data
data(meuse)
#check data meuse
meuse
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
#install ggplot package/library
install.packages("ggplot2")
library(ggplot2)
# enter environmental data (inventati)
#energy can be produced by biofuels
biofuels <- c(120, 200, 350, 570, 750) #give an array to values and a name to the array
# oxydative hour for reaction of enzimes
oxydative <- c(1200, 1300, 21000, 34000, 50000)
#build dataframe and give to dataframe name d
d <- data.frame(biofuels, oxydative)
# check if d is complete
d
#let's use ggplot! you need to say your dataset(d) and the aestethic (aes) plus you can tell the function the geometry you want to use for graphic (point, linear...)
ggplot(d, aes (x =  biofuels, y = oxydative)) + geom_point()
#change color and size of points
ggplot(d, aes (x =  biofuels, y = oxydative)) + geom_point(size=5, col="red")
#let's use line instead of point
ggplot(d, aes(x= biofuels,y= oxydative)) + geom_line()
# and improve aestethic stuff
ggplot(d, aes(x= biofuels,y= oxydative)) + geom_line(size=2, col = "blue")
# you can even visualize point + line
ggplot(d, aes(x= biofuels,y= oxydative)) + geom_point(size=5, col="red") + geom_line()
# you can even design polygons
ggplot(d, aes(x= biofuels,y= oxydative)) + geom_polygon()

############## set a work directory 
setwd("C:/lab/")
#imoprt data from outside file and give dataset a name
covid <- read.table("covid_agg.csv", header = TRUE) #header serve per informare che la tabella ha un'intestazione con dei nomi
#visualizzare i dati importati
covid
#visualizza l'intestazione
head(covid)
#visualizza il summary
summary(covid)
# visualizza solo i nomi assegnati a righe e colonne ####### NEW FUNCTION
names(covid)
#grafico distribuzione geografica covid, utilizzando lat e long e geometria puntuale
ggplot(covid, aes(x=lon, y=lat)) + geom_point()
# aggiungere il dettaglio della dimensione dei punti in base al numero dei casi
ggplot(covid, aes(x = lon, y = lat, size = cases)) + geom_point()










