## Taller de R

## Objetos

x <- "character"
print(x)

x <- 3.6
print(x)

x <- 5
print(x)

x <- 4 + 3i
print(x)

x <- TRUE
print(x)

## Numeros

x <- 1/0
print(x)

y <- 0/0
print(y)

## Atributos

df <- read.table(file="./data/hw1_data.csv", sep=',', header=TRUE)

##names
names(df)

##dimensions
dim(df)

##class
class(df$Ozone)

## length
length(df$Ozone)

## Comentarios '#'

## Operador :

x <- 1:50
print(x)

## Función c()

x <- c(0.5, 0.7, 10.5)
print(x)

x<- c(TRUE, TRUE, FALSE)
print(x)
x <- c("a", "b", "c")
print(x)

x <- c(1.7, "a")
print(x)
as.numeric(x)

## Coerción explicita. Funciones "as.*"
x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

## Matrices

m <- matrix(nrow=2, ncol=3)
m
dim(m)
attributes(m)

x <- 1:6
m <- matrix(x, nrow=2, ncol=3)

m <- 1:10
dim(m) <- c(2,5)
m

## Ejercicio. xyz.dat
## SE trata de una matriz cuadrada

df <- read.table(file="./data/xyz.dat", sep=",", header=FALSE)
head(df)
names(df) <- c("x","y", "z")
z <- df$z
