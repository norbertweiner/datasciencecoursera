
##Hiearchical clustering

* An agglomerative approach
> Find closest two things  
> Put them together  
> Find next closest  

* Requires
> A defined distance
> A merging approach

* Produces
> A tree showing how close things are to each other

* Distance or similarity
> Continuous - euclidean distance
> Continuous - correlation similarity
> Binary - manhattan distance - travel along city blocks - sum of all the coordinates

* Hiearchical Clustering
1. dist
a. dist(dataFrame) - default is euclidean distance
b. distxy<-dist(dataFrame) ------hClustering<-hclust(distxy)--plot(hClustering)
c. myplclust(hClustering, lab=rep(1:3,each=4),lab.col=rep(1:3,each=4))

* heatmap()
dataMatrix<-as.matrix(dataFrame)[sample(1:12),]  
heatmap(dataMatrix)

##K-means Clustering

> pick a distance/similarity that makes sense for your problem 

* K-means clustering
1. A partition approach
2. Requires: a defined distance metric; a number of clusters; an initial guess as to cluster centroids. 
  
3. Example 
set.seed(1234)  
par(mar = c(0, 0, 0, 0))  
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)  
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)  
plot(x, y, col = "blue", pch = 19, cex = 2)  
text(x + 0.05, y + 0.05, labels = as.character(1:12))  

a. Guess Centroid 
b. Clustering
c. update centroid by means of cluster

4. kmeans() -- parameters: x, centers, iter.max, nstart
dataFrame <- data.frame(x, y)  
kmeansObj <- kmeans(dataFrame, centers = 3)  
names(kmeansObj)  
par(mar = rep(0.2, 4))  
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)  
points(kmeansObj$centers, col = 1:3, pch = 3, cex = 3, lwd = 3)  
set.seed(1234)  
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]  
kmeansObj2 <- kmeans(dataMatrix, centers = 3)  
par(mfrow = c(1, 2), mar = c(2, 4, 0.1, 0.1))  
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")  
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")  

5. Notes
a. pick by eye
b. pick by cross validation
c. Determing number of clusters


##Dimension Reduction  Principal Components Analysis and Principal Components Analysis and Singular Value Decomposition Singular Value Decomposition

par(mar = rep(0.2, 4))  
heatmap(dataMatrix)  

add a pattern  
set.seed(678910)
for (i in 1:40) {  
 # flip a coin  
 coinFlip <- rbinom(1, size = 1, prob = 0.5)  
 # if coin is heads add a common pattern to that row  
 if (coinFlip) {  
 dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 3), each = 5)  
 }  
}  

* Related Problems
1. Find a new set of multivariate variables that are uncorrelated and explain as much variance as possible  
2. If you put all the variables together in one matrix, find the best matrix created with fewer variables (lower rank) that explains the original data  
The first goal is statistical and the second goal is data compression.  

* Related Solutions
1. SVD decomposition
2. PCA

* Components of the SVD u and v
1.  
svd1 <- svd(scale(dataMatrixOrdered))  
par(mfrow = c(1, 3))  
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])  
plot(svd1$u[, 1], 40:1, , xlab = "Row", ylab = "First left singular vector",pch = 19)  
plot(svd1$v[, 1], xlab = "Column", ylab = "First right singular vector", pch = 19)  

2. Variance Explained --  D matrix  
par(mfrow = c(1, 2))  
plot(svd1$d, xlab = "Column", ylab = "Singular value", pch = 19)  
plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", ylab = "Prop. of variance explained", pch = 19)  

3. SVD and PCA doing same thing

4. Vairance Explained

5. Missing Value
library(impute)
impute data with nearest data sets


6. Approximation

svd1 <- svd(scale(faceData))  
Note that %*% is matrix multiplication  
Here svd1$d[1] is a constant  
approx1 <- svd1$u[, 1] %*% t(svd1$v[, 1]) * svd1$d[1]  
In these examples we need to make the diagonal matrix out of d  
approx5 <- svd1$u[, 1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[, 1:5])  
approx10 <- svd1$u[, 1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[, 1:10])   


7. Notes
* Scale matters
* PC's/SV's may mix real patterns
* Can be computationally intensive
* Advanced data analysis from an elementary point of view
* Elements of statistical learning
* Alternatives
> Factor analysis
> Independent components analysis
> Latent semantic analysis





