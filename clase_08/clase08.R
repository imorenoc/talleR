

## Dates and Time

## Dates, clase Date

x <- as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("2024-10-16"))

## Time, clases POSIXct y POSIXlt
x <- Sys.time()
x

p <- as.POSIXlt(x)
names(unclass(p))
p$yday

p <- as.POSIXct(x)
unclass(p)
p$sec

## strptime
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, format="%B %d, %Y %H:%M")
x
class(x)

## Ejercicio

df <- read.table("./data/id5087_0.dat", sep=",", header=FALSE, skip=1)
names(df) <- c("id", "tiempo", "cenit", "acimut", "declinacion", "d", "p1", "p2", "p3", "r", "tsolar")
head(df,2)

time <- strptime(df$tiempo, format="%Y-%m-%d %H:%M:%S")
df$tiempo <- time

library("lattice")
xyplot(p3~p1, df, type="p")
xyplot(p3~p1 | factor(tiempo$yday), df, type="l", auto.key=TRUE)
xyplot(p3~p1, df, group=tiempo$yday, type="l", auto.key=TRUE)


## Color
## grDevices
## colorRamp: 0-1
## colorRampPalette: enteros

pal <- colorRamp(c("red", "blue"))
pal(0)
pal(1)
pal(0.5)

pal(seq(0,1,len=10))

## colorRampPalette
pal <- colorRampPalette(c("red", "blue"))
pal(2)
pal(10)

library(RColorBrewer)
cols<-brewer.pal(3,"BuGn")
cols
pal<- colorRampPalette(cols)
image(volcano, col=pal(20))


## Ejercicio
library(RColorBrewer)
library(lattice)
library(latticeExtra)

mypalette <- custom.theme(symbol=RColorBrewer::brewer.pal(9, "Set1"),
                          fill=RColorBrewer::brewer.pal(9, "Set1"),
                          region=RColorBrewer::brewer.pal(9, "Blues"),
                          bg="transparent", fg="black", pch=16)

xyplot( (90-cenit)~acimut, data=df, group=df$tiempo$yday, type=c('l','g'),
       par.settings=mypalette)

## Expresiones regulares

## - ^, inicio de linea
## - $, fin de linea
## - [], conjunto de caracteres [a-z] o [a-zA-Z]
## - ., se refiere a cualquier caracter
## - |,'or'
## - *, repetición
## - +, repetición, del último item
## - {, }, intervalo

## grep, grepl
## regexpr, gregexpr
## sub, gsub
## regexec
## regmatches

homicides <- readLines("./data/homicides.txt")
homicides[1]

grep("iconHomicideShooting", homicides)
length(grep("iconHomicideShooting", homicides))


length(grep("iconHomicideShooting|icon_homicide_shooting", homicides))
length(grep("Cause: [Ss]hooting", homicides))
length(grep("[Ss]hooting", homicides))

i <- grep("Cause: [Ss]hooting", homicides)
j <- grep("[Ss]hooting", homicides)
setdiff(i,j)
setdiff(j,i)
homicides[859]

## regexpr

homicides[1]
regexpr("<dd>[F|f]ound(.*)</dd>", homicides[1])
substr(homicides[1], 177, 177+93-1)

## regmatches
r <- regexpr("<dd>[F|f]ound(.*?)</dd>", homicides[1:5])
regmatches(homicides[1:5], r)
