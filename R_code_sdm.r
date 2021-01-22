#let's play with sdm
#recall libraries
library(sdm)
library(raster)
library(rgdal)
# import shapefile from the package
file <- system.file("external/species.shp", package="sdm") #we have to tell R to create a shp from that file
species <- shapefile(file) # you can use also readOGR
#let's have a look to the set
species
#and plot it
plot(species,pch=17)
#let's check number of presence/absence
species$Occurrence
#plot in different ways points with presence/absence 
plot(species[species$Occurrence == 1,],col='blue',pch=16)   # [] is subset   == in SQLlanguage is =
points(species[species$Occurrence == 0,],col='red',pch=16)
#let's put parameters
#import files entering paths
path <- system.file("external", package="sdm") 
#and list the data
# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) 
#and check them
lst
#let's stack all together different predictors and call the result preds
preds <- stack(lst)
#and plot predictors creating color ramp palette
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)
#plot just elevation with presence at the top   
plot(preds$precipitation, col=cl, main='precipitation')
points(species[species$Occurrence == 1,], pch=17)
# set the data for the sdm
datasdm <- sdmData(train=species, predictors=preds)
datasdm
#build the model
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=d, methods = "glm")
# make the raster output layer
p1 <- predict(m1, newdata=preds) 
# plot the output
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=16)
# let's put all together in a single stack
s1 <- stack(preds,p1)
plot(s1, col=cl)


