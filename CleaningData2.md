
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

> source("http://bioconductor.org/biocLite.R")
> biocLite("rhdf5")
> library(rhdf5)   created = h5createFile("example.h5")
> created=h5createGroup("example.h5","foo")
> created=h5createGroup("example.h5","baa")
> created=h5createGroup("example.h5","foo/foobaa")
> h5ls("example.h5")

> h5write(A,"example.h5","foo/A")
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

  con = url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ")
  htmlCode = readLines(con)
  close(con) 
  
  library(XML)
  url<-"https://scholar.google.com/citations?user=HI-I6C0AAAAJ"
  html<-htmlTreeParse(url,useInternalNodes=T)
  xpathSApply(html,"//title",xmlValue)
  
  library(httr)
  html2 = GET(url)
  content2 = content(html2,as="text")
  parsedHtml = htmlParse(content2,asText=TRUE)
  xpathSApply(parsedHtml,"//title",xmlValue)
  
###Websites with password
  
  


