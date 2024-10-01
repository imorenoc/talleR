
df <- read.table("./../clase_02/data/xyz.dat", sep=",", header=FALSE)
names(df) <- c("x", "y", "z")
head(df)

z <- df$
length(z)
n <- sqrt(length(z))
M <- matrix(z, nrow = n, ncol = n )

library(plot.matrix)
plot(M)

x <- 1:9
matrix(x, nrow= 3, ncol = 3)


## cbin-ing y rbind-ing
##

x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)

## List

x <- list(1, "a", TRUE, 1+4i)
x

## Factors

x <- factor( c("yes", "yes", "no", "yes", "no"))
x
table(x)
unclass(x)

x <- factor(c("yes", "yes", "no", "yes", "no"), levels=c("yes", "no"))
x

## Missing Values

##- is.na()
##- is.nan()
## NaN también es NA

x <- c(1,2,NA,10,3)
x
is.na(x)
is.nan(x)

## Data Frame
## ++++++++++
## read.table()
## read.csv()
## data.matrix()

x <- data.frame(foo=1:4, bar=c(T,T,F,F))
x
nrow(x)
ncol(x)
dim(x)

x <- 1:3
names(x)
names(x) <- c("foo", "bar", "north")
x
names(x)

x <- list(a=1, b=2, c=3)
x

## Subsetting

## - [
## - [[
## - $

x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[2]
x[1:4]
x[x > "a"]
u <- x > "a"
x[u]

length(x[x == "c"])

x <- matrix(data = 1:6, nrow = 2, ncol= 3)
x
x[1,2]
x[2,1]

x <- list(foo=1:4, bar=0.6)
x
x[[1]]
x$bar
x[["bar"]]

x <- list(aardvark=1:5)
x$a
x[["a"]]
x[["a", exact=FALSE]]

## REmove NA Values

x <- c(1,2, NA, 4, NA,5)
bad <- is.na(x)
x[!bad]


x <- c(1,2, NA, 4, NA,5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x,y)
good
x[good]
y[good]


###

head(airquality)
df <- airquality
sd(df$Ozone)

bad <- is.na(df$Ozone)
sd(df$Ozone[!bad])

good <- complete.cases(df)
df[good,][1:6,]
head(df)


