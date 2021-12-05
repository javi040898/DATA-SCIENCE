install.packages("rpart")
library(rpart)

#1.1
calificaciones<-read.table("datos.txt")
muestra=data.frame(calificaciones)
muestra

clasificacion=rpart(CG~.,data=muestra,method="class",minsplit=1) #minsplit para forzarla
clasificacion

#1.2
muestra2=read.table("datos2.txt")
muestra2

regresion=lm(D~R,data=muestra2)
regresion
summary(regresion)
