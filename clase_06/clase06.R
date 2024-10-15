

## Ejercicio

rut <- "./data/dbeta" 
files <- list.files(path=rut, pattern=".dat")
path <- paste(rut, "/", files[1], sep="")
df <- read.table(path, sep=",", header=FALSE, skip=1)

l <- list(df)

 for(f in files[-1]){
   path <- paste(rut, "/", f, sep="")
   df <- read.table(path, sep=",", header=FALSE, skip=1)
   len<-length(l)
   l[[len+1]] <- df
   }

length(l)
## 'id', 'tiempo', 'cenit', 'acimut', 'declinacion', 'd', 'p1'(V7), 'p2', 'p3'V(9), 'r', 'tsolar'

dfw <- l[[1]]
mean( sqrt(dfw$V7^2 + dfw$V9^2) )

lapply(l, function(x) mean(sqrt(x[[7]]^2 + x[[9]]^2)))
sapply(l, function(x) mean(sqrt(x[[7]]^2 + x[[9]]^2)))

## Ejercicio II

rut <- "./data/dbeta"
files <- list.files(path=rut, pattern=".dat")
path<-paste(rut, "/", files[1], sep="")
df <- read.table(path, sep=",", header=FALSE, skip=1)

for(f in files[-1]){
    path<-paste(rut, "/", f, sep="")
    aux <- read.table(path, sep=",", header=FALSE, skip=1)
    df <- rbind(df,aux)
    }
names(df) <- c('id', 'tiempo', 'cenit', 'acimut', 'declinacion', 'd', 'p1', 'p2', 'p3', 'r', 'tsolar')
head(df)
time <- strptime(df$tiempo, "%Y-%m-%d %H:%M:%S")
df$tiempo <- time
head(df)

tapply(df$p1, df$tiempo$yday, sd)

## Generación de numeros aleatorios

## rnorm
## dnorm
## pnorm

rnorm(10)
rnorm(10, mean=2, sd=3)

## runif
data <- runif(10000)
plot(data)
hist(data)
ddata <- density(data)
plot(ddata)

## rnorm
## regla 68-95-99.7

data <- rnorm(10000, mean=0, sd = 1)
plot(data)
hist(data)
ddata <- density(data)
plot(ddata)

cdf <- ecdf(data)
plot(cdf)


## Ploting

## - graphics: plot
## - lattice
## - ggplot2
## - grid

## par
## - pch: simbolo de la gráfica
## - lty: tipo de línea
## - lwd: nacho de linea
## - col: color de la línea

file <- "./data/hw1_data.csv"
df <- read.table(file, sep=",", header=TRUE)
head(df)

dfw <- df[df$Month==5,]
plot(dfw$Day, dfw$Temp, type='l')

png("plot01.png")
plot(dfw$Day, dfw$Temp, type='l')
dev.off()


## par()
par(mfrow=c(2,2))
plot(dfw$Day, dfw$Temp, type='l')
plot(dfw$Day, dfw$Temp, type='p', pch=2)
plot(dfw$Day, dfw$Temp, type='l', lty=2)
plot(dfw$Day, dfw$Temp, type='l', col=2)
par(mfrow=c(1,1))

## Lattice
library(lattice)
data(environmental)
df <- environmental
head(df)

## xyplot
xyplot(ozone~radiation, data=df, main="Ozone Vs. Radiation")

