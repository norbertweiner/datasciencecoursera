
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

##Creat New Vairiables

* Missingness indicators
* Applying transform
* Quantitative viriable

* Creating Sequences(index for data)
> s1<-seq(1,10,by=2)
> seq(1,10,length=3)
> x<-c(1,3,8,25,100)   seq(along=x) loop through x generate index

* Subsetting Variables
> %in%
> restData$zipWrong = ifelse(restData$zipCode<0,TRUE,FALSE)    table(restData$zipWrong, restData$zipCode<0)

* Creating categorical variables
> restData$zipGroups = cut(restData$zipCode,breaks=quantile(restData$zipCode))
> table(restData$zipGroups, restData$zipCode)

* Easier Cutting
> library(Hmisc)
> restData$zipGroups = cut2(restData$zipCode,g=4)   table(restData$zipGroups)

* Creating factor variables
> restData$zcf <- factor(restData$zipCode)

* levels of factor variables
> yesno<-sample(c("yes","no"),size=10,replace=T)    yesnofac=factor(yesno,levels=c("yes","no"))  set "yes" as lowest level
> relevel(yesnofac, ref="yes")
> as.numeric(yesnofac)   then, lowest level is 1, hight level is 2

* using the mutate function
> library(Hmisc)  library(plyr)
> restData2 = mutate(restData,zipGroups=cut2(zipCode,g=4))   table(restData2$zipGroups)

* Common Transformation
> abs()
> sqrt()
> ceiling(x)
> round(x,digits=n)
> signif
> cos(x), sin(x)
> log(x)
> log2(x), log10(x)
> exp(x)

##Reshaping Data (goal is tidy data)
> library(reshape2)
> head(mtcars)

* Melting Data Frames
> mtcars$carname<-rownames(mtcars)  
> carMelt<-melt(mtcars,id=c("carname","gear","cyl"),measure.vars = c("mpg","hp"))  Melting other variables

* Casting Data Frames
> cylData <- dcast(carMetl,cyl~variable)   put the cyl to the left,  then other variables
> cylData <- dcast(carMelt, cyl~variable, mean)

* Averaging values
> tapply(InsectSpray$count, InsectSpray$spray,sum)

* Another way, split
> spIns = split(InsectSpray$count, InsectSpray$spray)
> lapply(spIns,sum)  
> unlist(sprCount)  sapply(spIns,sum)

* plyr package (work on data frame)
> ddply(InsectSprays,.(spray),summarize,sum=sum(count))  .() variables we want to summarize
> spraySums <- ddply(InsectSparys, .(spray), summarize, sum=ave(count,FUN=sum)  dim(spraySums)   sum for every A appreas in the dataset  
> arrange  for faster reordering without using order() commands
> acast   for casting as multi-dimensional arrays
> mutate   add new variables

##Managing Data Frames: dplyr

* chicago <- readRDS("chicago.rds")     dim(chicago)
* head(select(chicago, 1:5))
* head(select(chicago, city:dptp))
* 
* head(select(chicago, -(city:dptp)))   columns except these columns     i <- match("city", names(chicago))      j <- match("dptp", names(chicago))            head(chicago[, -(i:j)])

 
* Filter
> chic.f <- filter(chicago, pm25tmean2 > 30)          head(select(chic.f, 1:3, pm25tmean2), 10)        
> chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)            head(select(chic.f, 1:3, pm25tmean2, tmpd), 10)       

* Arrange 
> chicago <- arrange(chicago, date)
> chicago <- arrange(chicago, desc(date))

* Mutate & rename
> Renaming a variable in a data frame in R is surprising hard to do!
> chicago <- rename(chicago, dewpoint = dptp, pm25 = pm25tmean2)   new names = old names
> chicago <- mutate(chicago,pm25detrend=pm25-mean(pm25, na.rm=TRUE))

* Group by
> chicago <- mutate(chicago, tempcat = factor(1 * (tmpd > 80), labels = c("cold", "hot")))
> hotcold <- group_by(chicago, tempcat)
> summarize(hotcold, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))
> chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)
> years <- group_by(chicago, year)
> summarize(years, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2, na.rm = TRUE), no2 = median(no2tmean2, na.rm = TRUE))

* %>% pipline operation
> chicago %>% mutate(month = as.POSIXlt(date)$mon + 1) %>% group_by(month) %>% summarize(pm25 = mean(pm25, na.rm = TRUE),o3 = max(o3tmean2, na.rm = TRUE), no2 = median(no2tmean2, na.rm = TRUE))       It is like Unix pipeleine. No temporal variables are required

##Merging Data Set

* merge()
> mergedData = merge(reviews,solutions,by.x="solution_id",by.y = "id", all=TRUE)
> Default - merge all common column names  ( intersect(names(solutions),names(reviews))
> You could use join(), but features are limited. 

>dfList = list(d1,d2,d3)  join_all(dfList)

##HomeWork Play with dplyer
* It's important that you have dplyr version 0.4.0 or later . packageVersion("dplyr")
> cran<-tbl_df(mydf)
> rm("mydf")
*  select(), filter(), arrange(), mutate(), and summarize()
> select(cran, ip_id, package, country)
> we don't have to type cran$ip_id, cran$package
> columns are returned to us in the order we specified
> select(cran,r_arch:country)  we could use :
> do select(cran, -time) to omit the time column
> select(cran, -(X:size))

* Filter()
> filter(cran, package == "swirl")
> filter(cran, r_version == "3.1.1", country == "US")
> filter(cran, r_version <= "3.0.2", country == "IN")
> filter(cran, country == "US" | country =="IN")

* arrange()
> arrange(cran2, desc(ip_id))
> arrange(cran2, country, desc(r_version),ip_id)

* mutate()
> mutate(cran3, size_mb = size / 2^20)
> mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)

* summarize
> summarize(cran,avg_bytes = mean(size))

* group_by()
> by_package<-group_by(cran,package)
> summarize(by_package,mean(size))    all calculation on each group
> pack_sum <- summarize(by_package,count = n(),unique = n_distinct(ip_id),countries = n_distinct(country),avg_bytes = mean(size))
> quantile(pack_sum$count, probs = 0.99)   return 679
> top_counts<-filter(pack_sum,count>679)
> View(top_counts)
> top_counts_sorted<-arrange(top_counts,desc(count))  ggplot2, Rcpp, plyr, rjava, DBI, LPCM, digest, stringr

* Chain %>%  like Unix Command
cran %>%
  group_by(package) %>%
  summarize(count = n(),
            unique = n_distinct(ip_id),
            countries = n_distinct(country),
            avg_bytes = mean(size)
  ) %>%
  filter(countries > 60) %>%
  arrange(desc(countries), avg_bytes)


* tidyr and readr
> each variable for one column
> res<-gather(students2,sex_class,count,-grade)
> separate(data=res,col=sex_class,into=c("sex","class"))
> gather(students3,class,grade,class1:class5,-name,na.rm = TRUE)
> spread(test,grade)
> mutate(class=parse_numeric(class))

* merge
> bind_rows()  
sat %>%
  select(-contains("total")) %>%
  gather(part_sex, count, -score_range) %>%
  separate(part_sex, c("part", "sex")) %>%
  group_by(part,sex) %>%
  mutate(total=sum(count),
         prop = count/total
  ) %>% print
