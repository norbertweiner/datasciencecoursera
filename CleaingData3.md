
##subsetting quick review

* x[]
* x[(x$var1<=3 & x$var3>11),]
* Dealing with missing values: X[which(x$var2>8),]
* sort(x$var1)  sort(x$var,decreasing=TRUE)
* x[order(x$var1),]  order is used for data frame      x[order(x$var1,x$var3),]   
* library(plyr)    arrange(X,var1)   arrange(X,desc(var1))

* add rows and column!!     x$var4<-rnorm(5)    or   Y<-cbind(X,rnorm(5))       rbind(X,rnorm(4)) bottom data frame


## Summarizing Data

* summary()  str()   quantile(data$var, na.rm=T)   quantile(..,prob=c(0.25,0.5,0.75))
* table(data$zipCode,useNA="ifany")  is there is missing values, then NA
* table(data$district, data$zipCode)    gives 2 dimensional table
* check for missing values:   sum(is.na(data$district))           any(is.na(rest$district))   all()
* colSums(is.na(data))  if it is equal to zero, then no na
* table(data$zipCode %in% c("21212"))   data[data$zipcode %in% c("21212","21213")
* Cross tab:  x<-xtabs(Freq~Gender+Admit,data=df)

