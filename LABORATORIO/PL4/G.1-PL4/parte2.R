install.packages("ggplot2")
install.packages("png")
library(ggplot2) 
library(png)
#lectura imagen PNG
img <- readPNG("eagle.png")
dims <- dim(img)
#dims
#leer colores rgb
coloresRGB <- data.frame(
  x = rep(1:dims[2], each = dims[1]),
  y = rep(dims[1]:1, dims[2]),
  #as.vector:convierte matriz distribuida a vector no distribuido
  R = as.vector(img[,,1]), 
  G = as.vector(img[,,2]),
  B = as.vector(img[,,3])
  )
numClust <- 13
#ALGORITMO KMEANS
clasifKmeans <- kmeans(coloresRGB[, c("R", "G", "B")], centers = numClust)
numColors <- rgb(clasifKmeans$centers[clasifKmeans$cluster,])
ggplot(data = coloresRGB, aes(x = x, y = y)) + 
  geom_point(colour = numColors) +
  labs(title = paste("Resultados Kmeans para ", numClust, " clusters. "))
#ALGORITMO CLARA
install.packages(c("cluster", "factoextra"))
library(cluster)
library(factoextra)
clasifClara <- clara(coloresRGB, numClust, metric = "euclidean", stand = FALSE, samples = 10, pamLike = FALSE)
fviz_cluster(object = clasifClara, ellipse.type = "t", geom = "point",
             pointsize = 2.5) +
  labs(title = "Resultados CLARA")

