#let's make a map about energy
# using rasterdiv package wich now contains copernicus data
install.packages("rasterdiv")
install.packages("rasterVis")
library(rasterdiv)
library(rasterVis)
#library(rasterdiv) recalls also library(raster)
#let's recall data wich are called copNDVI
data(copDVI)
#let's plot it
plot(copNDVI)
#we want to remove blue, so we need to reclassify
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
levelplot(copNDV)
#let's play with color
#palette with yellow at minimum
clymin <- colorRampPalette(c('yellow','red','blue'))(100)
plot(copNDVI, col=clymin)
#yellow in medium part
clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)
# yellow at maximum rate
clymax <- colorRampPalette(c('blue','red','yellow'))(100) #
plot(copNDVI, col=clymax)
# let's visualize 2 graphs one beside the other
par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) #
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) #
plot(copNDVI, col=clymax)
#zoom to a certain part of the map
italy_ext <-c(0,20,35,55)
#and crop it
copNDVI_Italy <-crop(copNDVI,ext)
plot(copNDVI_Italy, col=clymax)
ext <- c(0,20,35,55)  # xmin xmax ymin ymax
copNDVI_Italy <- crop(copNDVI, ext)
plot(copNDVI_Italy, col=clymax)
 
 
