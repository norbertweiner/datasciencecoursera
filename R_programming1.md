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
* atomic classes: numeric, logical, character, integer, complex
* vectors, lists
* factors
* missing values
* data frames
* names


##Reading Data

* read.table()   read.csv
* readLines()   
* source
* dget   (inverse of dput)
* load (reading in saved workspaces)
* unserialize (reading single R objects in binary form)

* Writing Data

	write.table()
	writeLines()
	dump()
	dput()
	save()
	serialize()
	
* Read.table(file, header, sep, colClasses, nrows, comment.char, skip, stringsAsFactors) Default is character column will be converted to FACTORS, otherwise set stringAsFactors = FALSE

* Reading Large Table

	Tell R that the data type for each column. Speed up read.table()
	
	initial = read.table("datatable.txt",nrows = 100)
	classes = sapply(initial,class)
	tabAll = read.table("datatable.txt",colClasses = classes)
	
* Textual Formats

	dumping and dputing 
	Unlinke writing out a table or csv file, dump and dput preserve the metadata (sacrificing some readability). so that another user dones't have to specify it all over again. 
	Textual formats adhare to "Unix philosophy"
	Textual formats are not space efficient
	
	y = data.frame(a=l, b="a")
	dput(y,file = "y.R")  will reconstruct data
	new.y = dget("y.R")
	dumping R objects
	
* Interfaces to the Outside World (Connection Interface)

	file, opens a connection to a file
	gzfile, connection to file compressed with gzip
	bzfile, connection to file compressed with bzip2
	url, open connection to a webpage
	
	file(description = "file_name_", open = "r/w/a/rb/wb/ab", blocking= true, encoding=getoption("encoding"))
	
	con<-file("foo.txt","r")
	data<-read.csv(con)
	close(con)
	is same as data<- read.csv("foo.txt")
	
	Connection useful for reading parts of the file
	
	con<-gzfile("words.gz")
	x<-readLines(con,10)
	
	con<-url("http://www.jhsph.edu","r")
	x<-readLines(con)
	close(con)
	
###Subsetting

* Subsetting

	 [ always returns an object of the same class
	 
	 [[ extract elements of a list or a data frame
	 
	 $ extract elements of a list or data frame by name
	 
	 x = c("a","b")    x is a vector
	 x[1:2]   Numerical Index
	 x[x > "a"]  Logical Index
	 or we can create a logical vector
	 u <- x > "a"
	 x[u]

* Subsetting List

	x = list(foo = 1:4, bar = 0.6)
	
	first element name foo, second element name bar
	
	x[1]  always return same class object , return a list containing the sequence
	
	x[[1]]  return the sequence
	
	x$bar return 0.6
	
	x[["bar"]] return 0.6
	
	x["bar"]  return a list
	
	x[c(1,2)]  return the list
	
	[[]] operator can be used with computed indices; $ can only be used with literal names
	name = "foo"
	x[[name]]   OK 
	x$name  look for "name" , so doesn't exist
	
	[[ can take an integer sequence
	x = list(a=list(10,12,14),b=c(3.14,2.81))
	if I want to find 14, then
	x[[c(1,3)]]	or x[[1]][[3]]

* Subsetting Matrix

	x<-matrix(1:6,2,3)
	
	x[1,2] return 3    this 3 is numeric, not 1 by 1 matrix
	x[1, ] return first row
	x[1,2,drop = FALSE] then, return 1 by 1 matrix, with 3 in it
	
	
* Partial Matching

	partial matching of names is allowed with [[ and $
	
	x = list(aardvark = 1:5)
	
	x$a return 1:5
	
	x[["a"],exact=FALSE] return 1:5   different from $
	
* Removing NA Values

	x<-c(1,2,NA,4,NA,5)
	
	bad <- is.na(x)
	
	x[!bad]  return (1,2,4,5)
	
	if there are multiple things, and you want to subset all missing values
	
		good <- complete.case(x,y)
		good = complete.case(dataframe)
		


* Vectorized Operation

	x<-1:4   y = 6:9
	
	x+y return a vector, no loop is needed
	
	x*y return a vector  element*element
	
	x/y  return a vector, element/element
	

	x = matrix(1:4,2,2); y=matrix(rep(10,4),2,2)
	
	x*y  return matrix, element wise
	x %*% y return matrix, real matrix multiplication
	
	

## Quiz
* x[x %in% 1:5] = 0
* vector addition has recycle rule

	
	
	
	
	
	
	
	
	