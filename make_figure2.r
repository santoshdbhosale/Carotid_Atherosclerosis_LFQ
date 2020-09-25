data<-read.csv("volcano.csv", header=TRUE)

data$threshold = as.factor(data$pvalue < 0.05)

g <- ggplot(data=data, 
            aes(x=log2FoldChange, y =pvalue, 
            colour=threshold)) +
  geom_point(alpha=0.4, size=1.75) +
  xlim(c(-1, 1)) +
  xlab("log2 fold change") + ylab("-log10 p-value") +
  theme_bw() +
  theme(legend.position="none")
g

