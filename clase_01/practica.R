
getwd()

file <- "./data/hw1_data.csv"
df <- read.table(file, sep=',', header=TRUE)

head(df)
tail(df)

View(df)

dim(df)

class(df$Ozone)

sapply(df, class)

summary(df)

sapply(df, sd, na.rm=TRUE)

good <- complete.cases(df)
correlations <- cor(df[good,])
correlations

pairs(df)
pairs(Day~., df, col=df$Day)


library(corrplot)
corrplot(correlations, method="circle")


par(mfrow=c(1,4))
for(i in 1:4){
  hist(df[,i], main=names(df)[i])
}

library(lattice)
par(mfrow=c(1,4))
for(i in 1:4){
  plot( density(df[good,i]), main=names(df)[i])
}


par(mfrow=c(1,4))
for(i in 1:4){
  boxplot(df[,i], main=names(df)[i])
}

library(Amelia)
missmap(df)
