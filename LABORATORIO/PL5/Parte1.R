
(muestra=matrix(c(4,4,4,3,5,5,1,1,5,4),2,5))
(muestra<-t(muestra))

(distancias = as.matrix(dist(muestra)))
(distancias = matrix(distancias,5,5))

for (i in 1:5){
	(distancias[,i] = sort(distancias[,i])); 
	(distanciasordenadas = distancias)
	}
distanciasordenadas

for (i in 1:5){
	if (distanciasordenadas[4,i]>2.5) { #2.5 grado de outlier
		print(i); print("es un suceso anomalo o outlier")
	}	
}

(muestra = t(matrix(c(3,2,3.5,12,4.7,4.1,5.2,4.9,7.1,6.1,6.2,5.2,14,5.3),2,7, dimnames=list(c("r","d")))))
(muestra <-data.frame(muestra))


(muestra=matrix(c(4,4,4,3,5,5,1,1,5,4),2,5))
(muestra<-t(muestra))

(distancias = as.matrix(dist(muestra)))
(distancias = matrix(distancias,5,5))

for (i in 1:5){
	(distancias[,i] = sort(distancias[,i])); 
	(distanciasordenadas = distancias)
	}
distanciasordenadas

for (i in 1:5){
	if (distanciasordenadas[4,i]>2.5) { #2.5 grado de outlier
		print(i); print("es un suceso anomalo o outlier")
	}	
}

(muestra = t(matrix(c(3,2,3.5,12,4.7,4.1,5.2,4.9,7.1,6.1,6.2,5.2,14,5.3),2,7, dimnames=list(c("r","d")))))
(muestra <-data.frame(muestra))


(muestra=matrix(c(4,4,4,3,5,5,1,1,5,4),2,5))
(muestra<-t(muestra))

(distancias = as.matrix(dist(muestra)))
(distancias = matrix(distancias,5,5))

for (i in 1:5){
	(distancias[,i] = sort(distancias[,i])); 
	(distanciasordenadas = distancias)
	}
distanciasordenadas

for (i in 1:5){
	if (distanciasordenadas[4,i]>2.5) { #2.5 grado de outlier
		print(i); print("es un suceso anomalo o outlier")
	}	
}

(muestra = t(matrix(c(3,2,3.5,12,4.7,4.1,5.2,4.9,7.1,6.1,6.2,5.2,14,5.3),2,7, dimnames=list(c("r","d")))))
(muestra <-data.frame(muestra))

#DIAGRAMA DE CAJA Y BIGOTES
(boxplot(muestra$r, range=1.5, plot=TRUE))




