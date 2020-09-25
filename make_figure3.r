# Load your data here
df = read.table("roc_panel.txt", dec = ".", header = TRUE)
row.names(df) <- df$ID
df$ID <- NULL

# Insert the panel you want to study here
best_features_id = c("P23142-4","P02649","P55290")

# Create a data frame for logistic regression models
df_best = cbind(data.frame(t(df[best_features_id,])), group = 1*grepl("CA", rownames(t(df[best_features_id,]))))

install.packages("pROC")

#df_apob = data.frame(BEST = t(df[c("P23142-4"),]), group = 1*grepl("CA", rownames(t(df[c("P23142-4"),]))))
fit1 = glm(group ~ P23142.4, data = df_best, family = binomial)
roc1 = pROC::roc(df_best$group, predict(fit1,newdata = df_best, type = "response"), ci = TRUE)

fit2 = glm(group ~ ., data = df_best, family = "binomial")
roc2 = pROC::roc(df_best$group, predict(fit2, newdata = df_best, type = "response"), ci = TRUE)

pROC::roc.test(roc1,roc2)

par(pty="s")
plot(roc1, col = "red", main = "ROC curves")
plot(roc2, add = TRUE, col = "blue")
legend(x = "bottomright", col = c("red","blue"), lty = 1, lwd = 2, legend = c("P23142-4",paste(best_features_id, collapse = " + ")))


