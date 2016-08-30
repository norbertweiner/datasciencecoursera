##Logic Operation

* TRUE & c(TRUE, FALSE, FALSE)    TRUE is recycled across every element in the vector
* TRUE && c(TRUE, FALSE, FALSE)   only compare the first element of the right vector
* | recycled
* || only first element
* Order: &&-->||--->!=
* isTRUE(6 > 4)
* identical('twins','twins')
* xor(5 == 6, !FALSE)  return TRUE
* ints <- sample(10)     which(ints>7)  return [1] 1 3 5   position of TRUE
* any() function will return TRUE if one or more of the elements in the logical vector is TRUE

##Functions

* directyly type function without parenthesis, you will see the source code
* args("function name")  you can see the argument
* evaluate <- function(func, dat)
* evaluate(sd,c(1,2,3))   sd, not sd()
* evaluate(function(x){x[1]}, c(8,4,0))
* paste (..., sep = " ", collapse = NULL)
* Let's explore how to "unpack" arguments from an ellipses
    add_alpha_and_beta <- function(...){
      args <- list(...)
      alpha <- args[["alpha"]]
      beta  <- args[["beta"]]
      alpha + beta 
    
    }
    
* Define own binary operator 
    "%mult_add_one%" <- function(left, right){left * right + 1}


##Date and Times

Dates are represented by the 'Date' class and times are represented by the 'POSIXct' and 'POSIXlt' classes. 
Internally, dates are stored as the number of days since 1970-01-01 and times are stored as either the number 
of seconds since 1970-01-01 (for 'POSIXct') or a list of seconds, minutes, hours, etc. (for 'POSIXlt').

*d1<-Sys.Date()
*class(d1)    unclass(d1) return days from 1970-01-01
* t1<-Sys.time()   class(t1)   [1] "POSIXct" "POSIXt" 
* t2<-as.POSIXlt(Sys.time())  str(unclass(t2))     We can use t2$min
*  weekdays(), months(), and quarters()
* Often, the dates and times in a dataset will be in a format that R does not recognize. The strptime() function can be helpful
      t3<-"October 17, 1986 08:24"
      t4<-strptime(t3, "%B %d, %Y %H:%M")
*Operator 
        Sys.time() - t1   return unit is mins
        difftime()    difftime(Sys.time(), t1, units = 'days')
        

##Control Structure

* for(letter in x){print letter}
* for(i in seq_along(x)){print x[i]}
* for(i in seq_len(x)){print x[i]}
* stop loop : break      
* next  : skip and re-loop
* return : stop and return the value

##Functions

* f<-function(<argument>) { Do something }   firt class object. Pass functio as variables. Could Nest functions
* Match argument by name and by position
* Lazy Evaluation  
* ... Arguement     
* Scoping Rules: Symbol Binding     search()  search global environment first, then search namespace of the packages
* R has separate namespaces for functions: object named c while function named c
* Scoping Rules
* lexical scoping :
1.the values of free variables are searched for in the environment in which the function was defined;
2.An environment is a collection of (symbol, value) pairs;
3.every environment has a parent environment;
4.A function + an environment = a closure 
5.search until top-level environment, this usually global or package namespace; Then, search down until reach empty environment

>Function could return another function in R
                    

  
