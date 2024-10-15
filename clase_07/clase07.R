

library(lattice)
data(environmental)
df <- environmental
head(df)
dim(df)
names(df)

## xyplot

xyplot(ozone~radiation, data=df, main="Ozone Vs Radiation")

temp.cut <- equal.count(df$temperature, 4)

xyplot(ozone~radiation | temp.cut , data=df)

xyplot(ozone~radiation | temp.cut , data=df, layout=c(1,4))

## splom
splom(~df)

## histogramas

histogram(~temperature, data=df)

wind.cut <- equal.count(df$wind, 4)
histogram(~ozone | wind.cut, data=df)

## ggplot
library(ggplot2)
df<- data.frame(mpg)
head(df)
dim(df)

## qplot
qplot(x=displ, y=hwy, data=mpg)

qplot(displ, hwy, data=mpg, color=factor(cyl))

qplot(displ, hwy, data=mpg, geom=c("point", "smooth"))

qplot(hwy, data=mpg, fill=drv)

qplot(displ, hwy, data=mpg, facets=.~drv)

qplot(hwy, data=df, facets=drv~., binwidth=2)

## ggplot
g <- ggplot(data=df, aes(x=displ, y=hwy))
g + geom_point()
g + geom_point() + geom_smooth()
g + geom_point() + geom_smooth(method="lm")

g + geom_point() + facet_grid(.~drv) + geom_smooth(method="lm")

g + geom_point(color="steelblue", size=4, alpha=1/2)

g + geom_point( aes(color=drv), size=4, alpha=1/2 ) + labs(title="My title") + labs(x="x label", y="ylabel")


## Anotaciones matemáticas
pdf("./fig/latex.pdf")
plot(0,0, main=expression(theta==0),
     ylab = expression(hat(gamma) ==0),
     xlab= expression(sum(x[i]*y[i], i==0, n)))
dev.off()
