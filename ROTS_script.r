if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("ROTS")

library(ROTS)
rots.data = read.table("ROTS_matrix.txt", dec = ".", header = TRUE)
row.names(rots.data) <- rots.data$ID
rots.data$ID <- NULL
groups = c(rep(0,43), rep(1,43))
groups

results = ROTS(data = rots.data, groups = groups , B = 100 , K = 500 , seed = 1234)
names(results)
summary(results, fdr = 0.05) 
