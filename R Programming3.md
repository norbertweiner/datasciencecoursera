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


##LOOPING 

*lapply: Loop over a list and evaluate a function on each element           lapply(x, runif, min = 0, max = 10)    anonymous function: lapply(x, function(elt) elt[,1])

*sapply: Same as lapply but try to simplify the result


*apply: Apply a function over the margins of an array
        1. apply is used to a evaluate a function (often an anonymous one) over the margins of an array
        2.  x <- matrix(rnorm(200), 20, 10);  apply(x, 2, mean); apply(x, 1, sum)
        3. apply(x, 1, quantile, probs = c(0.25, 0.75))  20% quantile and 75% quantile
        4. a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))  10 matrix, every matrix is 2 by 2  three dimentional array  apply(a, c(1, 2), mean)   mean for every element in matrix across 10 matrix

*tapply: Apply a function over subsets of a vector


*mapply: Multivariate version of lapply

        1.  mapply(noise, 1:5, 1:5, 2)---noise <- function(n, mean, sd)-----The return is same as list(noise(1, 1, 2), noise(2, 2, 2),noise(3, 3, 2), noise(4, 4, 2),noise(5, 5, 2))

##Split

        *split(x,f,drop=FALSE,...)  x is a vector or data frame,  f is a factor or a list of factors
        * x <- c(rnorm(10), runif(10), rnorm(10, 1))      f <- gl(3, 10)     split(x, f)   gl() generate a factors
        *  lapply(split(x, f), mean)
        * split data frame: 
                        1.  s <- split(airquality, airquality$Month)
                        2. lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
                        3. sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")])) 
                        4. sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")],na.rm = TRUE))
                        5. Split more than one level: x <- rnorm(10)   f1 <- gl(2, 5) 2 levels, each repeat 5 times f2 <- gl(5, 2)  gender and race, two level.  interaction(f1,f2) is combination of two levels and 5 levels, total 10 levels. 
                        split(x,list(f1,f2), drop=T)  automatically do the interaction. drop will drop empty levels. 


