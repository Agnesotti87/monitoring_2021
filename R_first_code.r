# Write whatever you want here!
#this is an array
primates <- c(3,5,9,15,40)
crabs <- c(100,70,30,10,5)
#first plot in R
plot(primates, crabs)
plot(primates, crabs, col="red")
plot(primates, crabs, col="red", pch=19)
plot(primates, crabs, col="red",pch=19,cex=2)
plot(primates, crabs, col="red",pch=19,cex=6)
plot(primates, crabs, col="red",pch=19,cex=6, main="My first ecological graph in R!")
# create dataframe
ecoset <- data.frame(primates,crabs)
# mean number of individual per site
(3+5+9+15+40)/5
#summary of dataframe
summary(ecoset)


 
