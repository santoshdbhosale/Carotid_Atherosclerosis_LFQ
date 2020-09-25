## load the data
df = read.table("FBLN-1C.txt", dec = ".", header = TRUE)

## generate the boxplot
ggplot(df, aes(x=factor(Condition), y=FBLN1C, fill=Condition)) + geom_boxplot(notch=TRUE)
