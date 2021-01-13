#point pattern analysis
#install packages spatstat and recall its library
#set wd 
setwd(C/:lab/)
#recall codiv data
covid <- read.table(covid_agg.cvs, header=TRUE)
#attach our dataset
attach(covid)
#covid density map with planar point pattern (function ppp - coordinates x,y and their ranges)
#remember how were indicated x and y?
names(covid)
covid_planar <- ppp(lon,lat,c(-180,+180), c(-90,+90))  
#in a global scale, planar coordinates x is from -180 to +180, y from -90 to +90. 
#For local value you can use min nad max value limits of dataset
###ranges are ARRAY!!
# create a map of density
density_map <- density(covid_planar)
# plot density map
plot(density_map)
#add points on top of the map
points(covid_planar)
#change range colors of the map 
#first create a color ramp palette with the function and give it a name
cl <- colorRampPalette(c('yellow','orange','red'))(100) 
#then plot it again
plot(density_map, col=cl)
#ando show points again
points(covid_planar)

#let's add also countries
#download shapefile of coastlines and put them in directory we are using
#install rgdal package: what is that?
# gdal library for R, developed by OSGeo -> Open Software Geo
install.packages("rgdal")
library(rgdal)
#let's use readOGR function, wich reads vector into spatial object and give it a name   
#readOGR("filename.extension")
coastlines <- readOGR("ne_10m_coastline.shp")
#and plot it
plot(density_map, col=cl)
points(covid_planar)
plot(coastlines, add=TRUE) # add= TRUE allows to put it on top of layers
#change shape of points to see them better
points(covid_planar, pch=19)
#to export map you need function png("name export. estensione") + commands you use to layout maps + dev.off()
png("Figure1.png")
plot(density_map, col=cl)
points(covid_planar)
plot(coastlines, add=TRUE) 
dev.off()
# you will find the map in the wd
#or you can create a pdf in the same way
pdf("Figure1.pdf")
plot(density_map, col=cl)
points(covid_planar)
plot(coastlines, add=TRUE) 
dev.off()

#INTERPOLATION
#explain to R what interpolate with function is marks(object obtained from ppp) <- column you want to use
marks(covid_planar) <- cases
#interpolate with function: Smooth
cases_map <- Smooth(covid_planar)
# if appears Warning message: Least Squares Cross-Validation....don't worry: R is telling you that you have a few data for interpolation
#now plot it and add to layout points and world map
plot(cases,col=cl)
points(covid_planar)
plot(coastlines, add=TRUE)

# TIPS: if it takes time to elaborate map is because of coastlines...let's simplify it!
gSimplify(coastlines,tol=3;topologypreserve=T) #ERROREEEEEEEEEEEEEEEEE SCRIVI A DUCCIO!!!!!!!!!!



