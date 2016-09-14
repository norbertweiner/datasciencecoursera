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
> names(p); 45 names property for this object
> p[["formula"]]

* example
p <- xyplot(y ~ x | f, panel = function(x, y, ...) {  
  panel.xyplot(x, y, ...)  ## First call the default panel function for 'xyplot'  
  panel.abline(h = median(y), lty = 2)  ## Add a horizontal line at the median  
})  
print(p)  
invisible()  

* myedit("plot2.R")
> table(diamonds$color,diamonds$cut)  
> xyplot(price~carat|color*cut,diamonds,strip = FALSE,pch=20,xlab = myxlab,ylab = myylab,main=mymain)  

##Working with Colors
* grDevices package
> sample(colors(),10)  

> colorRamp, takes a palette of colors (the arguments) and returns a function that takes values between 0 and 1 as arguments. The 0 and 1 correspond to the extremes of the color palette. Arguments between 0 and 1 return blends of these extremes.  

> pal<-colorRamp(c("red","blue"))   pal(0)

> We see a 1 by 3 array with 255 as the first entry and 0 in the other 2. This 3 long vector corresponds to red, green, blue (RGB) color encoding commonly used in televisions and monitors. In R, 24 bits are used to represent colors. Think of these 24 bits as 3 sets of 8 bits, each of which represents an intensity for one of the colors red, green, and blue.  

> We'll turn now to colorRampPalette, a function similar to colorRamp. It also takes a palette of colors and returns a function. This function, however, takes integer arguments (instead of numbers between 0 and 1) and returns a vector of colors each of which is a blend of colors of the original palette.  

> p1<-colorRampPalette(c("red","blue"))  
> p1(6)  
> "#FF0000" "#CC0033" "#990066" "#650099" "#3200CC" "#0000FF"  
> "0x"cc     cc=204    Then 0x33 = x*16+3 = 51.   red 204 and blue 51
