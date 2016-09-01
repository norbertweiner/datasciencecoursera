##str()  
* It could be used on data.frame, factors, functions and etc. After split, we can also use str()

##Generating Random Numbers

* d for density, r for random number generation, p for cumulative distribution, q for quantile
* set.seed(1)  every time reset seed, you get same random sequence
* ppois(2,2) prob. less than 2 when lamda = 2

##Generating Random Numbers From a Linear Model

* error term is normal
* GLM: error is poisson(u)   
* 
##Random Sampling

*sample()  could do sample, or permutation

##R Profilier 

* system.time()   return an object of class proc_time    user time: CPU time   elapsed time: "wall clock" time
* parallel package
* Rprof()            summaryRprof() summarize the output from Rprof()    
* the output of summaryRprof(), by.total divides the time in each function by total run, by.self  subtracts out time spent in functions
* 













##Looking at Data

*object.size(plants)  tells you how many memory are occupied

*Looking at Data

  1. class()
  2. dim()
  3. names()
  4. object.size()
  5.head(x,10)
  6.summary()
  7.table(plants$Active_Growth_Period)
  8.str()
  

##Simulation

  *sample(x, size, replace = FALSE, prob = NULL)
  *sample(1:6, 4, replace = TRUE)
  *LETTERS
  *flips<-sample(c(0,1),100,prob=c(0.3,0.7),replace = TRUE)
  * r... function (for "random"), a d... function (for "density"), a p... (for"probability"), and q... (for "quantile")
  *rbinom(1, size = 100, prob = 0.7)       want to see 1s and 0s,   flips2<-rbinom(100, size = 1, prob = 0.7)
  *rpois(5,lambda = 10)   replicate(100, rpois(5, 10))   replicate() created a matrix, each column of which contains 5 random numbers generated from a Poisson distribution with mean 10
  *cm<-colMeans(my_pois)    hist(cm)    column mean is normal distributed --> Central Limit Theorem
  *exponential (rexp()), chi-squared (rchisq()), rgamma()
  
  
##Basic Graphs

* data(cars) load included data frame
*plot() is short name of scatter plot
*plot(cars, xlim=c(10,15))
*plot(cars, col=2)
*plot(cars, pch=2)
*boxplot(formula, data = NULL, ..., subset, na.action = NULL)
*boxplot(formula=mpg~cyl,data=mtcars)

  boxplot(), like many R functions, also takes a "formula" argument, generally an expression with a tilde ("~") which indicates
  the relationship between the input variables. This allows you to enter something like mpg ~ cyl to plot the relationship between
  cyl (number of cylinders) on the x-axis and mpg (miles per gallon) on the y-axis.
  


  
  
