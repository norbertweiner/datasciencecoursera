## Loop Functions

 * cls_list <- lapply(flags, class)
 * viewinfo()    generate a text file: description of the data
 * lapply, l means list    it will return a list
 * In general, if the result is a list where every element is of length one, then sapply() returns a vector. If the result is a
list where every element is a vector of the same length (> 1), sapply() returns a matrix. If sapply() can't figure things
out, then it just returns a list, no different from what lapply() would give you.
*the unique() function returns a vector with all duplicate elements removed
*lapply(unique_vals, function(elem) elem[2])    self defined function



##Loop Functions vapply and tapply

*Whereas sapply() tries to 'guess' the correct format of the result, vapply() allows you to specify it explicitly. If the
result doesn't match the format you specify, vapply() will throw an error, causing the operation to stop. This can prevent
significant problems in your code that might be caused by getting unexpected return values from sapply().

*vapply(flags, unique, numeric(1))    vapply(flags, class, character(1))

*As a data analyst, you'll often wish to split your data up into groups based on the value of some variable, then apply a 
function to the members of each group. The next function we'll look at, tapply(), does exactly that.
tapply(X, INDEX, FUN = NULL, ..., simplify = TRUE)

*table(flags$landmass)  how many flags/countries fall into each group

*tapply(flags$animate, flags$landmass,mean)   Index is flags$landmass,  mean of the anime under different index
        1         2         3         4         5         6 
0.4193548 0.1764706 0.1142857 0.1346154 0.1538462 0.3000000 

*tapply(flags$population, flags$red, summary)

##lapply

##apply
* apply function to arrays

apply(x,margin=2, mean)  x is 20 by 10 matrix. margin=2 means the second dimension. function works on every column

* rowSum = apply(x,1,sum)   so we have rowMean, colSum, ColMean.

* apply(x,1,quantile,c(0.25,0.75)) calculate 25% and 75% quantile for each row. return a matrix has 2 rows and many columns

##mapply

* str(mapply)

* apply a function to multivariate lists 

* mapply(noise,1:5,1:5,2)   noise is a function with 3 parameters . first is how many rv, second is mean, third is sd.  noise(1,1,2)  noise(2,2,2)  noise(3,3,2) ....

##tapply

* tapply(x,Index,function,..)
	x is a vector  
	index is a factor or a list of factors  
	return statistics for each group


##split

split(x,f) x is a vector, f is a factor list

split data frame in montly peices

* s<-split(airquality,aiquality$month)







