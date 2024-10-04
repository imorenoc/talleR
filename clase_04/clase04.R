## Ejercicio
head(airquality)

## 01
df <- airquality
m <- df$Month == 8
df[m,]

head(df[df$Month == 8, ])

## 02
df[df$Day == 21, ]

## 03
tmax <- max(df$Temp)
df[df$Temp == tmax, ]

mes <- 5
dfw <- df[df$Month == mes, ]
dfw[dfw$Temp == max(dfw$Temp), ]

## Operaciones vectorizadas

x <- 1:4; y <- 6:9
x + y
x > 2
x >= 2
y == 8
x*y
x/y

## Operaciones vectoriales con matrices
x <- matrix(1:4,2,2); y <- matrix(rep(10,4),2,2)
x*y
x/y

## multiplicación matricial

x%*%y

## Lectura y escritura de datos

## - read.table, read.csv // write.table
## - readLines // writeLines
## - source, file.R
## - load, file.rda // save

file <- "./data/preciosBCSday.csv"
data <- read.table(file, sep =",", header=TRUE)
head(data)

## readLines
file <- "./data/homicides.txt"
data <- readLines(file)
data[2]

## Control de estructuras

## if
x <- 1
if (x>3){
    y <- 10
} else{
    y <- 0
}
print(y)

## for
for(i in 1:5){
    print(i)
}

x <- c("a", "b", "c", "d")
for(i in 1:4){
    print(x[i])
    }

for(i in seq_along(x)){
    print(x[i])
}

x <- matrix(1:6,2,3)
for(i in seq_len(nrow(x))){
    for(j in seq_len(ncol(x))){
        print(x[i,j])
    }
}

## while
count <- 0
while(count < 10){
    print(count)
    count <- count + 1
}

## Funciones

f <- function(x,y){
    z <- x + y
    return(z)
    }

x <- 1:4
y <- x^2
f(x,y)

##
args(lm)


d2r <- function(x){
    z <- x * pi/180
    return(z)
}

d2r(90)

## Argumento de "..."
myplot <- function(x,y,type="l", ...){
    plot(x,y, type="l", ...)
}

## Funciones de funciones
make.power<- function(n){
    pow<-function(x){
        x^n
    }
    pow
}

cube <- make.power(3)
square <- make.power(2)

cube(3)
square(3)

## Loop function

## lapply
## sapply
## apply
## tapply
## mapply
