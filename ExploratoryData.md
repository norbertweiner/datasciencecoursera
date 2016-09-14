##Lattice System

* package
1. lattice package: xyplot, bwplot, levelplot
2. grid package:  

* good at multivariate data plotting  
> xyplot(y ~ x | f * g, data). The f and g represent the optional conditioning variables. The * represents interaction between them.
> xyplot(Ozone~Wind|as.factor(Month),data=airquality,layout=c(5,1))  

* trellis class
> p<-xyplot(Ozone~Wind,data=airquality)  
> print(p)  
> names(p)
