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
#deforestation examples
#import data in R
#to import 1 raster you can recall with raster()
#to import many layers, like in this case you can use brick(namefile.extension)
#remember to give it a name
defor1<-brick("defor1_.png")
#check information of defor1
defor1
#is a 8 bit image, means binary information
#let's plot here
plot(defor1)
#to see 3 level together, giving a level to every band
plotRGB(defor1, 1, 2, 3, stretch="Lin")
#and reverse color
plotRGB(defor1, 3, 2, 1, stretch="Lin")
#let's import and plot defor2
defor2 <- brick("defor2_.png")
defor2
plotRGB(defor2,1,2,3, stretch="Lin")
#put images one beside the other with par function
par(mfrow=c(2,1))
plotRGB(defor1, 1, 2, 3, stretch="Lin")
plotRGB(defor2,1,2,3, stretch="Lin")
#calculate DVI for defor1
#first of all check names of different layer, you can find them tapping defor1 on the raw "names"
#NIR=defor1_.1
dvi1 <- defor1$defor1_.1-defor1$defor1_.2
plot(dvi1)
#let's change color ramp palette
cl <-colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl)
#calculate DVI2
dvi2 <- defor2$defor2_.1-defor2$defor2_.2
plot(dvi2, col=cl)
#plot them together and put a title
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")
#calculate how much biomass we lost
difdiv<- dvi1-dvi2
plot(difdiv)
#give it a different ramp palette and a title
cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif, main="amount of energy lost!")
#let's create also an histogram
hist(difdvi,col="red")
#put analysis all toghether
par(mfrow=c(3,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
plot(dvi1, col=cl, main="biomass before cut")
plot(dvi2, col=cl, main="biomass after cut")
plot(difdvi, col=cldif, main="amount of energy lost!")
hist(difdvi,col="red")
