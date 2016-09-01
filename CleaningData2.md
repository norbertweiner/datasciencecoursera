
##reading from mysql

###Local Mysql:  root@localhost   pwd:*****1988    zhangzhang@localhost  pwd:******1987

* ucscDb<-dbConnect(MySQL().user="genome",host="genome-mysql.cse.ucsc.edu")
* result<-dbGetQuery(ucsc,"show databases;"); dbDisconnect(ucscDb);
* hg19<-dbConnect(MySQL(),user='genome',db="hg19",host="genome-mysql.cse.ucsc.edu");allTables<-dbListTables(hg19);allTables[1:5]
* dbListFields(hg19,"affyU133Plus2")     dbGetQuery(hg19,"select count(*) from affyU133Plus2")
* affyData<-dbReadTable(hg19,"affyU133Plus2")    load the whole table
* subset of data:   query<-dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 1 and 3")
* affyMis<-fetch(query); quantile(affyMis$misMatches)
* affyMisSmall<-fetch(query,n=10) only fetch 10 rows. dbClearResult(query);
* r blogger  r-sql


##Reading from HDF5

* source("http://bioconductor.org/biocLite.R")
> biocLite("rhdf5")
> library(rhdf5)   created = h5createFile("example.h5")
> created=h5createGroup("example.h5","foo")
> created=h5createGroup("example.h5","baa")
> created=h5createGroup("example.h5","foo/foobaa")
> h5ls("example.h5")

* h5write(A,"example.h5","foo/A")
> B = array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
> attr(B,"scale")<-"liter"
> h5write(B,"example.h5","foo/foobaa/B")
> h5ls("example.h5")

* write df to the hdf5
> h5write(df,"example.h5","df") directly write to the top group

* read data set
> readA = h5read("example.h5","foo/A")
> readB = h5read("example.h5","foo/foobaa/B")

* Easily to read and write chunks

> h5write(c(12,13,14),"example.h5","foo/A",index=list(1:3,1))  replace these elements in foo/A by indexing

##Reading Data from Web (webscraping  extracting data from the HTML code of websites)

###Google Scholar example

* con = url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ")
> htmlCode = readLines(con)
> close(con) 

* library(XML)
> url<-"https://scholar.google.com/citations?user=HI-I6C0AAAAJ"  
> html<-htmlTreeParse(url,useInternalNodes=T)  
> xpathSApply(html,"//title",xmlValue)  
  
* library(httr)   
> html2 = GET(url)  
> content2 = content(html2,as="text")  
> parsedHtml = htmlParse(content2,asText=TRUE)  
> xpathSApply(parsedHtml,"//title",xmlValue)  
  
###Websites with password
* pg2 = GET("http://httpbin.org/basic-auth/user/passwd",authenticate("user","passwd"))  
> names(pg2)  Then we could use Content to extract the response

* Using handles
> google = handle("http://google.com")
>> pg1 = GET(handle=google,path="/")
>> pg2 = GET(handle=google,path="search")   Don't need to keep authenticate, cookies are stored


##Reading Data From API

* using httr could get it from API
> myapp = oauth_app("twitter",key = "yourConsumerKeyHere",secret = "yourConsumerSecretHere")  
> sig = sign_oauth1.0(myapp,token="yourTokenHere",token_secret = "yourTokenSecretHere")  
> homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json",sig)  
> homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json",sig)  
> json1 = content(homeTL)  
> json2 = jsonlite::fromJSON(toJSON(json1))  
> httr allows GET,POST,PUT,DELETE requests if you are authorized

##Reading from other sources
*file - open connection to text file
*gzfile - 
*bzfile - 

* read.arff
* read.dta
* read.mtp
* read.xport (SAS)
* read.spss
* read.octav

* reading images:  jpeg, readbitmap, png, EBImage

* GIS data:  rdgal, rgeos, raster

* Music Data: tuneR,  seewave

* RMongo

##Homework from WEEK3
1. When readlines, we get many lines. if we do GET, then it is a char vector
2. read.fwf for fixed width data set. 
3. library(readr)

4. x <- readLines(con=url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"))  
5. Skip 4 lines  
6. x <- x[-(1:4)]  
7. mydata <- data.frame(var1 = substr(x,1,10),  
                     var2 = substr(x, 16,19),  
                     var3 = substr(x, 20, 23),  
                     var4 = substr(x, 29, 32)  
                     )  
8. x<-read_fwf("fxiedWidthFile",skip = 4,fwf_widths(c(12, 7, 4, 9, 4, 9, 4, 9, 4)))

##http://stackoverflow.com/questions/14383710/read-fixed-width-text-file  SOLVE TAQ DATA TOO
##https://github.com/hadley/httr/blob/master/demo/oauth2-github.r








