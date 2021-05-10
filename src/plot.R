# Use cValid to choose appropriate algorithm
intern <- clValid(data_scaled, nClust = 2:10, 
              clMethods = c("hierarchical","kmeans","pam"), validation = "internal", maxitems=nrow(data_scaled))

# Summary
summary(intern) %>% kable() %>% kable_styling()

## view results
summary(intern)
optimalScores(intern)
plot(intern) 

# View dendrogram
Dist <- dist(data_scaled,method="euclidean")
clusterObj <- hclust(Dist, method="ward.D")
nc <- 4 ## number of clusters
cluster <- cutree(clusterObj,nc)
plot(clusterObj, cex = 0.6) # plot tree
rect.hclust(clusterObj, k = 4, border = 2:5) # add rectangle
