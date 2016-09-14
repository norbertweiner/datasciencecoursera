##Principles

1. Show Comparison
2. Show causality, mechanism,explanation,systematic structure
3. Show multivariate data
4. Integration of evidence
5. Describe and document the evidence 
6. Content is king

##Exploratory Graphs
1. summary()
2. boxplot(data,col="blue")
3. hist(data,col="green")   rug(data)   
4. hist(data,col="green",breaks=100)  rug(data)
5. boxplot(data)  abline(h=12)
6. hist(data,col="green")   abline(v=12,lwd=2)  abline(v=median(data),col="magnenta",lwd=4)
7. barplot(table(pollution$region),col="wheat",main="Number of Counties in Each Region")

* 2 dimentional summary
1. boxplot(pm25~region,data=pollution,col="red")
2. with(pollution,plot(lattitude,pm25))   aline(h=12,lwd=2,lty=2)  
3. with(pollution,plot(lattitude,pm25,col=region))   use color
4. par(mfrow=c(1,2),mar=c(5,4,2,1)) with(subset(pollution,region=="west"),plot(lattitude,pm25,main="WEST"))    
    with(subset(pollution,region=="east"),plot(lattitude,pm25,main="EAST"))   
5. R Graph Gallery

##Plotting
1. Base Plotting System   plot()    text,lines,points    annotation
2. Lattice System
3. ggplot2 

* Base plotting
> graphics package, grDevices  
> ?par   parameter for graph  
> key base graph parameters:  pch: plotting symbol; lty: the line type; lwd:the line width;  col: color;   xlab: x axis;  ylab: y axis  par()   las: orientation of the axis    bg: background color;  mar: margin size;   oma: the outer margin size;  mfrow:number of plots per row  mfcol: number of plots per row, column (plots are filled column wise)  
> par("bg")   par("mar")   par("mfrow")  

* Base Plotting 2
> plot;   lines: add line to points;  text: add lables withn plot;  tile: add annotation to x, y axis   mtext: add arbitrary text  
> axis: specify axis taste  
> regression line:  with(airquality,plot())   model<-lm(Ozone~wind,airquality)  abline(model,lwd=2)
> par(mfrow = c(1,2))   with(airquality, {plot(),plot()}

* Demonstration
1. example(points)
2. plot(x,y,pch=4)
3. title("scatter plot")
4. text(-2,-2,"Label")   legend("topleft",legend = "Data",pch = 20)   fit<-lm(y~x)    abline(fit,lwd=3,col = "blue")
5. z<-rpois(100,2)     par(mfrow=c(2,1))   plot(x,y,pch=20)    plot(x,z,pch=19)    par(mar=c(2,2,1,1))

* plot(x,y,type = "n")  points(x[g=="Male"],y[g == "Male"], col="green")  points(x[g=="Female"],y[g == "Female"], col="red")

##Graph Devices
1. screen device   plot, xyplot,  qplot
2. file devices  windows()    
> pdf(file = "")   with(data,plot())   title()   dev.off()    
> pdf(), svg() (web brower, interactive), win.metafile(), postscript()   VECTOR FORMATS  
> Bitmap Formats:  png; jpeg; tiff; bmp;   BIT MAP FORMATS  
> plot one graphic device at a time; dev.cur()  current active graphic device;  dev.set(<integer>)  switch to device    
> Copying Plots:dev.copy(png,file="")  dev.off()    dev.copy2pdf() : copy plot to pdf  

##Swirl Study

There are two basic types of file devices, vector and bitmap devices. These use different formats and have different characteristics. Vector formats are good for line drawings and plots with solid colors using a modest number of points, while bitmap formats are good for plots with a large number of points, natural scenes or web-based plots.

* dev.set(<integer>) where <integer> is the number associated with the graphics device  
* dev.copy(png,file="geyserplot.png")
* with(cars,plot(speed,dist))    text(mean(cars$speed),max(cars$dist),"SWIRL rules!")  three parameters are positions and text
* table(state$region)
* xyplot(Life.Exp~Income|region,data = state,layout=c(4,1))
* ggplot2
> qplot(displ,hwy,data=mpg)  

* Base Plotting
> table(airquality$Month)  
> boxplot(Ozone~Month, airquality, xlab="Month", ylab="Ozone (ppb)",col.axis="blue",col.lab="red")  
> names(par());  par()$pin;   
> These include las (the orientation of the axis labels on the plot), bg (background color), mar (margin size), oma (outer margin size), mfrow and mfcol (number of plots per row, column).  
> attnonation:  text, title, lines, points  
> points(notmay$Wind,notmay$Ozone,col="red",pch=8)  
> legend("topright",pch=c(17,8),col=c("blue","red"),legend=c("May","Other Months"))  
> abline(v=median(airquality$Wind),lty=2,lwd=2)  




