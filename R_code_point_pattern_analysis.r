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

#install rgdal package: what is that?
# gdal library for R, developed by OSGeo -> Open Software Geo
install.packages("rgdal")
library(rgdal)




