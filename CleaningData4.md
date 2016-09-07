##Editing Text Variables

* tolower(names(cameraData))  toupper
* strsplit(names(cameraData),"\\.")   split with "."
* sapply(splitNames,firstElement)    firstElement<-function(x){x[1]}
* sub("_","",names(reviews),)  every time find "_", replace it with ""  just replace first "_" 
> we use gsub() to replace all "_"

* grep("Alameda",cameraData$intersection)
> grepl("Alameda",..) return TRUE or FALSE Could use it for subsetting data
> grep(,value=TRUE)  will return values, not just the position

* library(stringr)
> nchar("")   length of the string
> substr()
> paste()
> paste0()  paste no space
> str_trim()    trim off accessive spaces


##Regular Expressions
* Metacharacters:
> ^I think   ^ begining with I think
> $ in the end of sentence
> ^[Ii] am       beginiing of the line either capital I or little i
> ^[0-9][a-zA-Z]
> [^?.]$
> "." mean any character     9/11 or 9-11
> flood|fire      | character (or)
> ^[Gg]ood|[Bb]ad   begining with Good/good or Bad/bad
> [Gg]eorge([Ww]\.)? [Bb]ush    ? means () part is optional     \. is literal . 
> * means any item, + means "at least one of the item           (.*)   somthing between parentheses
> [0-9]+ (.*)[0-9]+
> { and } are referred as interval quantifiers
> \1 or \2 means repetition     +([a-zA-Z]+) +\1 +   match night night night
> ^s(.*)s goest for longest possible expression 
> ^s(.*?)s$

##Working with Dates
* date() just return characters
* Sys.Date() return "Date" class
* format(d2,"%a %b %d")    %d = day as number;  %a = abbreviated weekday  %A = unabbreviated weekday  %m = month(00-12)  %b = abbreviated month  
 %B = unabbreviated month  %y = 2 digit year, %Y = four digit year
* as.Date(x, "%d%b%Y)

* weekdays(d2)
* months(d2)
* julian(d2)

* library(lubridate)
> ymd("20140108")
> mdy("08/04/2013")
> ymd_hms("")
> ymd_hms(".....:, tz="Pacific/Auckland")
> wday(x[1]) return 3    wday(x[1],label=True) return Tues        POSIXlt  POSIxct

## Data Resources

* United Nations  data.un.org
* data.gov/opendatasites
* gapminder.org
* asdfree.com  survey data
* infochimps Marketplace
* Kaggle


## Homework Dates and Times with lubridate

* help(package=lubridate)
* year()  month()  day()
* wday()
* ymd_hms(dt1)
* hms("03:22:14")
* you can directly parse vectors
* update(this_moment, hours = 8, minutes = 34, seconds = 55)

* nyc<-now(tzone = "America/New_York")
> nyc + days(2)    depart<-nyc + days(2)
> depart<-update(depart,hours=17,minutes=34)
> arrive<-depart+hours(15)+minutes(50)
> arrive<-with_tz(arrive,tzone = "Asia/Hong_Kong")
> last_time<-mdy("June 17, 2008",tz="Singapore")
> how_long<-interval(last_time,arrive)
> as.period(how_long)
> the authors of lubridate introduce four classes of time related objects: instants, intervals,durations, and periods
> stopwatch()





