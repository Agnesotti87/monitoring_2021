#let's measure pollution in time
#setwd
setwd("C:/lab/")
#recall libraries you need
library(raster)
#upload in r all images
EN01 <- raster("EN_0001.png")
# do it for the 13 images 
#create a ramp palette
cl <- colorRampPalette(c('red','orange','yellow'))(100)
#and plot the data
par(mfrow=c(1,2))
plot(EN01, col=cl)
plot(EN13, col=cl)
#difference in time of no2
difno2 <- EN01-EN13
#and plot it
cldif <- colorRampPalette(c('blue','black','yellow'))(100) # 
plot(difno2, col=cldif)
# how to create a video of it? 
#  https://www.r-bloggers.com/2018/10/the-av-package-production-quality-video-in-r/
#let's just plot them all together
par(mfrow=c(4,4))
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)
#let's make a stack, wich is a faster way to plot all of them
EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13)
plot(EN,col=cl)
#let's  layout in RGB, using a different layer for every NO2 quantity
plotRGB(EN, red=EN13, green=EN07, blue=EN01, stretch="lin")
#let's make a boxplot with boxplot function
boxplot(EN,horizontal=T,axes=T,outline=F, col="red",xlab="NO2 - 8bit", ylab="Period")



