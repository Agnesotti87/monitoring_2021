# R code for multivariate analysis
#install vegan package (vegetation analysis)
install.packages("vegan")
library(vegan)
#set wd e load workspace created by Duccio Rocchini "biomes_multivar.RData"
setwd("C:/lab/")
load("biomes_multivar.RData")
#list files inside
ls()
# plot species matrix with decorana ()
multivar <- decorana (biomes)
#let's check statistical value
multivar
# eigenvalues = autovettori. Ti dicono la lunghezza dei vari assi, dunque dove sono maggiormente distribuite le specie. 
#Quindi per ridurre le dimensioni, si possono prendere gli assi con valore + alto
#plottiamo il tutto
plot(multivar)
#così visualizziamo la distribuzione di tutte le specie, quelle nello stesso bioma saranno vicine tra loro
#aggiungiamo i biomi, disegandoli come fossero ellissi, con la funzione ordiellipse()= put an ellipse in the ordination (type of MVA realte to decorana)
#prima andrà fatto l'attach individuando il nome della colonna che contiene i tipi di biomi
attach(biomes_types)
#and check names you will need for ordiellipse function 
names(biomes_types)
ordiellipse(multivar,type,col=c("black","red","green","blue"),kind="ehull", lwd=3)
#aggiungiamo legenda? meglio! aggiungiamo le etichette



