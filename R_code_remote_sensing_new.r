#R code for remote sensing data analysis to monitor ecosystem chianging in space and time
install.packages(c("raster", "RStoolbox"))
library(raster)
library(RStoolbox)
#set the work directory
setwd("C:/lab/")
#upload images and give file a name
p224r63_2011<-brick("p224r63_2011_masked.grd")
#check metadata
p224r63_2011
#plot graph to see single band
plot(p224r63_2011)
#put different color palette for every band
cl <- colorRampPalette(c('black','grey','light grey'))(100) # 
plot(p224r63_2011, col=cl)
#plot only first 4 bands in 2 rows and 2 columns
par(mfrow=c(2,2))
#assegnare una gamma di colori e visualizzare il plot
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
plot(p224r63_2011$B1_sre, col=clb)
