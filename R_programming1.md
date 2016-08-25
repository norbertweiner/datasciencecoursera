### R programming

vector()  only contain same class
list()	  contain different classes

* Number

	 numbers in R treated as numeric objects
	 special: Inf; NaN
	 
	 complex is an object. complex number. 

* Attributes

	 names, dimnames
	 dimensions
	 class
	 length
	 other user-defined attributes/metadata
	 
* Creating Vectors

	x <- c(0.5,0.6)    c() could be used to create a vector
	x<- vector("numeric",length = 10)
	When differnt objects are mixed in a vecotr, **coercion** occurs so that every element in the vector is of the same class
	
* Explicit Coercion

	as.numeric()   as.character()
	
* Lists
	
	x <- list(1,"a",TRUE,1+4i)   double bracket for the index
	
* Matrices

	m <- matrix(nrow = 2, ncol = 2)
	dim(m)
	attributes(m)
	
	Columnize 
	m = matrix(1:6, nrow = 2, nclo = 3)    columnize
	
	m = 1:10
	dim(m) <- c(2,5)
	
	cbind and rbind to create matrix
	cbind(x,y)  column binding
	rbind(x,y)  row binding
	
* Factor

	Factors are used to represent categorical data
	x <- factor(c("yes","yes","no"))
	table(x)
	
	x <- factor(c("yes","yes","no"),levels = c("yes","no"))  yes is first level, no is second level
	
* Missing Values

	is.na()    usually for mathematical values   
	is.nan()
	
	is.na()  include Na and NaN
	is.nan()  only include NaN

* Data Frames
	read.table() or read.csv() or x = data.frame(foo = 1:4, bar = c(T,T,F,F)) column name foo
	row.names
	data.matrix()   convert to matrix
	
* Name

	x = 1:3
	names(x) = c("a","b","c")
	dimnames(matrix) = list(c(row name),c(column names))
	
###Data types
* atomic classes
* vectors, lists
* factors
* missing values
* data frames
* names


##Reading Data

* read.table()   read.csv
* readLines()   
* source
	
	
	
	