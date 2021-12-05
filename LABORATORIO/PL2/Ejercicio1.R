
install.packages("arules")
install.packages("arulesViz")


library(arules)
library(arulesViz)

muestra<-Matrix(c(1,1,0,1,1, 1,1,1,1,0, 1,1,0,1,0, 1,0,1,1,0, 1,1,0,0,0, 0,0,0,1,0),6,5,byrow=TRUE,dimnames=list(c("Suceso1","Suceso2","Suceso3","Suceso4","Suceso5","Suceso6"),c("Pan","Agua","Cafe","Leche","Naranjas")),sparse=TRUE)

muestrangCMatrix<-as(muestra,"nsparseMatrix")

transpmuestratrangCMatrix<-t(muestrangCMatrix)

transacciones<-as(transpmuestratrangCMatrix,"transactions")

summary(transacciones)


inspect(transacciones)

asociacionesap<-apriori(transacciones,parameter=list(support=0.5,confidence=0.8))

inspect(asociacionesap)

itemsets <- eclat(transacciones, parameter = list(supp = 0.5, maxlen = 5))

asociacionesec <- ruleInduction(itemsets, transacciones, confidence = 0.8)
inspect(rules)


plot(asociacionesap,method = "graph")
plot(asociacionesap,method = "scatterplot")

plot(asociacionesec,method = "graph")
plot(asociacionesec,method = "scatterplot")




