



## Loop Function

## lapply
x <- list(a=1:5, b=rnorm(10))
lapply(x, mean)

x <- list(a=matrix(1:4,2,2), b = matrix(1:6,3,2))
x

lapply(x, function(elt) elt[,1])


## sapply
x <- list(a=1:5, b=rnorm(10))
sapply(x, mean)

x <- list(a=1:4, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
x

sapply(x, sd)

## apply

x <- matrix(rnorm(20), 5,4)
x

apply(x,2, mean)

apply(x,1, sum)

# rowSums = apply(x, 1, sum)
# rowMeans = apply(x,1, mean)
# colSums
# colMeans

x <- matrix(rnorm(160), 8,20)
apply(x, 1, quantile, probs=c(0.25,0.5,0.75))

## tapply
str(tapply)

x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10)

tapply(x, f, mean)

## mapply

## split
x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10)
split(x,f)

sapply( split(x,f), mean)

## Ejercicio
# Leer los datos .dat de la carpeta dbeta, y guardarlos en una lista.

rut<-"./data/dbeta"
files<- list.files(path=rut, pattern=".dat")
path<- paste(rut,"/",files[1], sep="")
df <- read.table(path, sep=",", header=FALSE, skip=1)

l <- list(df)
for(f in files[-1]){
    path <- paste(rut,"/", f, sep="")
    df <- read.table(path, sep=",", header=FALSE, skip=1)
    len <- length(l)
    l[[len+1]]<-df
    }

length(l)




