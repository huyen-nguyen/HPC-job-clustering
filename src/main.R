# Usage Behavior Analysis with Clustering Job Accounting Data
# Huyen Nguyen

# Acknowledgement to https://towardsdatascience.com/10-tips-for-choosing-the-optimal-number-of-clusters-277e93d72d92
# and https://cran.r-project.org/web/packages/clValid/clValid.pdf


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

raw_data <- read.csv("/Users/huyennguyen/Huyen/GitHub/HPC-job-clustering/data/data.csv")

# subset dataset
data <- raw_data %>% select(-name) # set rownames
data <- as_tibble(data)

# Glimpse the data set
glimpse(data)

# Summary of data set
summary(data) %>% kable() %>% kable_styling()

# Scale the data
data_scaled <- scale(data)
rownames(data_scaled) <- raw_data$name

# if names are not unique, make new names:
# library(stringi)
# nams <- stri_rand_strings(5000, 10) # 5000 is the length of data
# rownames(data_scaled) = make.names(nams, unique=TRUE)

# k-means ==============
km4h <- hierarchical(data_scaled, 4) # add more if you want to try

# Visualize
p3 <- fviz_cluster(km4, data = data_scaled, ellipse.type = "convex") + theme_minimal() + ggtitle("k = 4")
plot_grid(p3, labels = c("k4"))