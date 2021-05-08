library(tidyverse)
library(magrittr)
library(cluster)
library(cluster.datasets)
library(cowplot)
library(NbClust)
library(clValid)
library(ggfortify)
library(clustree)
library(dendextend)
library(factoextra)
library(FactoMineR)
library(corrplot)
library(GGally)
library(ggiraphExtra)
library(knitr)
library(kableExtra)

mammals <- read.csv("/Users/huyennguyen/Huyen/GitHub/HPC-job-clustering/data/data.csv")

mammals <- as_tibble(mammals)

# Glimpse the data set
glimpse(mammals)

# Summary of data set
summary(mammals) %>% kable() %>% kable_styling()

# Scale the data
mammals_scaled <- scale(mammals)

res.pca <- PCA(mammals_scaled,  graph = FALSE)

# Visualize eigenvalues/variances
fviz_screeplot(res.pca, addlabels = TRUE, ylim = c(0, 50))

