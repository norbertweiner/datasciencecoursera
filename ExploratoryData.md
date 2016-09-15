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
> "0x"cc   &  cc=204  &  Then 0x33 = x*16+3 = 51.  & red 204 and blue 51  it is the same as pal(seq(0,1,len=6)) second row
> showMe(p2(20))  
> ?rgb  
> p3<-colorRampPalette(c("blue","green"),alpha=0.5)  
> "#0000FFFF" "#003FBFFF" "#007F7FFF" "#00BF3FFF" "#00FF00FF"  
> We see that in the 5-long vector that the call returned, each element has 32 bits, 4 groups of 8 bits each. The last 8 bits represent the value of alpha. Since it was NOT ZERO in the call to colorRampPalette, it gets the maximum FF value. (The same result would happen if alpha had been set to TRUE.) When it was 0 or FALSE (as in previous calls to colorRampPalette) it was given the value 00 and wasn't shown. The leftmost 24 bits of each element are the same RGB encoding we previously saw.  
> So what is alpha? Alpha represents an opacity level, that is, how transparent should the colors be. We can add color transparency
with the alpha parameter to calls to rgb. We haven't seen any examples of this yet, but we will now.  


> plot(x,y,pch=19,col=rgb(0,0.5,0.5))  
> plot(x,y,pch=19,col=rgb(0,0.5,0.5,0.3))  

* RColorBrewer package
> cols<-brewer.pal(3,"BuGn")   
> showMe(cols)  
> pal<-colorRampPalette(cols)  
> image(volcano,col=pal(20))  


##ggplot2

* qplot(displ,hwy,data=mpg)
* qplot(displ,hwy,data=mpg,color=drv)   automatically drv types
* qplot(displ,hwy,data=mpg,color=drv,geom = c("point","smooth"))
* qplot(y=hwy,data=mpg,color=drv)
* qplot(drv,hwy,data=mpg,geom = "boxplot")
* qplot(drv,hwy,data=mpg,geom = "boxplot")
* qplot(drv,hwy,data=mpg,geom = "boxplot",color=manufacturer)   WOW!
* qplot(hwy,data=mpg,fill=drv)   histogram
* qplot(displ,hwy,data=mpg,facets = .~drv)  
The fourth is the argument facets which will be set equal to the expression . ~ drv which is ggplot2's shorthand for number of rows (to the left of the ~) and number of columns (to the right of the ~). Here the . indicates a single row and drv implies 3  
* qplot(hwy,data=mpg,facets = drv~.,binwidth=2)

###ggplot2 Part 2

Obviously, there's a DATA FRAME which contains the data you're trying to plot. Then the AESTHETIC MAPPINGS determine how data are mapped to color, size,etc. The GEOMS (geometric objects) are what you see in the plot (points, lines, shapes) and FACETS are the panels used in conditional plots. You've used these or seen them used in the first ggplot2 (qplot) lesson. There are 3 more. STATS are statistical transformations such as binning, quantiles, and smoothing which ggplot2 applies to the data. SCALES show what coding an aesthetic map uses (for example, male = red, female = blue). Finally, the plots are depicted on a COORDINATE SYSTEM.  

* qplot(displ,hwy,data=mpg,geom = c("point","smooth"),facets = .~drv)  
* g<-ggplot(mpg,aes(displ,hwy)) summary(g)  
* g+geom_point()  
* g + geom_point()+geom_smooth()  
* g + geom_point()+geom_smooth(method = "lm")  
* g + geom_point()+geom_smooth(method = "lm")+facet_grid(.~drv)  
* g + geom_point()+geom_smooth(method = "lm")+facet_grid(.~drv)+ggtitle("Swirl Rules!")  
* 
* g+geom_point(color="pink",size=4,alpha=1/2) && darker one means more data points in that place
* g+geom_point(size=4,alpha=1/2,aes(color=drv))  
* g + geom_point(aes(color = drv)) + labs(title="Swirl Rules!") + labs(x="Displacement", y="Hwy Mileage")   
* g+geom_point(size=4,alpha=1/2,aes(color=drv))+geom_smooth(size=4,linetype=3,method="lm",se=FALSE)  
* se flag told ggplot to turn off the gray shadows indicating standard errors   
* g + geom_point(aes(color = drv)) + theme_bw(base_family="Times")  
* g+geom_line()+ylim(-3,3)  
* g+geom_line()+coord_cartesian(ylim = c(-3,3))
* g<-ggplot(mpg,aes(displ,hwy,color=factor(year)))  
* g+geom_point()+facet_grid(drv~cyl,margins = TRUE)   The margins argument tells ggplot to display the marginal totals over each row and column  
* g + geom_point() + facet_grid(drv~cyl,margins=TRUE)+geom_smooth(method="lm",size=2,se=FALSE,color="black")+labs(x="Displacement",y="Highway Mileage",title="Swirl Rules!")  
* 

##ggplot Part 3
* qplot(price,data=diamonds) && range(diamond$price)
* qplot(price,data=diamonds,binwidth=18497/30)  
* qplot(price,data=diamonds,binwidth=18497/30,fill=cut)  
* qplot(price,data=diamonds,geom = "density")
* qplot(price,data=diamonds,geom = "density",color=cut)
* qplot(carat,price,data=diamonds,shape=cut)  
*  qplot(carat,price,data=diamonds,color=cut)+geom_smooth(method = "lm")  
*  qplot(carat,price,data=diamonds,color=cut,facets = .~cut)+geom_smooth(method = "lm")  
*  cutpoints <- quantile(diamonds$carat,seq(0,1,length=4),na.rm=TRUE)  
*  diamonds$car2<-cut(diamonds$carat,cutpoints)
*  g<-ggplot(data=diamonds,aes(depth,price))
*  g+geom_point(alpha=1/3)+facet_grid(cut~car2)  
*  g+geom_point(alpha=1/3)+facet_grid(cut~car2)+geom_smooth(method="lm",size=3,color="pink")  
*  ggplot(data=diamonds,aes(carat,price))+geom_boxplot()+facet_grid(.~cut)

