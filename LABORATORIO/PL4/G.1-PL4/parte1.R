
m<-matrix(c(4,4, 3,5, 1,2, 5,5, 0,1, 2,2, 4,5, 2,1),2,8)
m
(m<-t(m))#trasponer matriz
(cen<-t(matrix(c(0,1, 2,2),2,2)))
(clasificacionns<-kmeans(m,cen,4)) #paquete stats
(m=cbind(clasificacionns$cluster,m))
mc1=subset(m,m[,1]==1)
mc1
mc2=subset(m,m[,1]==2)
mc2
(mc1=mc1[,-1])
(mc2=mc2[,-1])

