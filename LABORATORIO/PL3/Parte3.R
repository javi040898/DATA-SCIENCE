install.packages("rpart")
install.packages("rpart.plot")
install.packages("plotmo")

library(rpart)
library(rpart.plot)
library(plotmo)

valoraciones<-read.table("datos3.txt")
muestraJ=data.frame(valoraciones)
muestraJ

#valoracion=rpart(V~. #arriba se pone punto si usamos todos los datos
valoracion=rpart(V~R+T+P,data=muestraJ,method="class",minsplit=1) #minsplit para forzarla
valoracion