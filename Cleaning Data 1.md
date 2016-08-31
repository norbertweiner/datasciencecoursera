
#Raw Data and Processed Data



#Components of Tidy Data

  ##The tidy data
  
      *Each variable you measure should be in one column
      *Each different observation of that variable should be in a different row
      *There should be one table for each "kind" of variable
      *If you have multiple tables, they should include a column in the table that allows them to be linked
      
  ##The code book
       

  ##The instruction list
       * The input for the script is the raw data
       * The ouput is the processed ,tidy data
       * There are no parameters to the script
       
  #Downloading Files
       * file.exist("directoryName")
       * dir.create("dir name")
       
       *if(!file.exist("data")){dir.create("data")}
       
       *download.file()
	   
##Download a file from the web
*fileUrl = "......"
*download.file(fileUrl,destfile = "./data/", method = "curl")   Since url is https/http, method = curl
*list.files("./data/")
*dataDownloaded = date()


##Reading Local file

*important parameters: file, header, sep, row.names, nrows

*Other important paramerters: 

	quote - quote=""
	na.strings   set the character that represents a missing value
	nrows
	skip

##Reading Excel Files

	*library(xlsx)
	*read.xlsx("",sheetIndex=1,header=TRUE)
	*ColIndex = 2:3, rowIndex= 1:4   read.xlsx("...", sheetIndex=1, colIndex = ColIndex, rowIndex = RowIndex)
	*XLConnect package more option to write and manipulate Excel files
	*XLConnect vignette
	
##Reading XML

	*Components
		Markup - labels that give the text structure
		Content - the actual text of the document
		
	*Tags, Elements, attributes
	
		Tags correspond to general labels
		
			start tag <section>
			end tags </section>
			empty tags <line-break />
			
		Elements are sepcific examples of tags
			
			<Greeting> Hello, world </Greeting>
			
		Attribute are components of the label
		
			<img src = "jeff.jpg" alt="instructor"/>
			<step number = "3"> Connect A to B. </step>
			
	*library(XML)
		fileurl = ""
		doc = xmlTreeParse(fileurl,useInternal=TRUE)
		rootNode = xmlRoot(doc)
		xmlName(rootNode)
		names(rootNode)
		
		rootNode[[1]]  similar as list
		rootNode[[1]][[1]]
		
		xmlSApply(rootNode,xmlValue) extract parts of the file
		
	*XPath
	
		/node   top node
		//node  any node
		node[@attr-name = 'bob']
		
		xpathSApply(rootNode,"//name",xmlValue) Loop all nodes' names
		
		fileUrl = "website"
		doc = htmlTreeParse(fileUrl,useInternal=TRUE)
		score = xpathSApply(doc,"//li[@class='score']",xmlValue)
		team = xpathSApply(doc, "//li[@class='team-name']")
		
##Reading Jason (data from API)

		Similar structure to XML but different syntax
		
		library(jsonlite)
		jsonData = fromjason("")
		names(jsonData)
		names(jsonData$owner)
		names(jsonData$owner$login)
		
		myjson = toJSON(iris,pretty = TRUE)
		cat(myjson)
		convert back to json   iris2 = fromJSON(myjson)
		

##Data.table

		Inherets from data.frame
		musch faster at subsetting
		
		library(data.table)
		DF = data.table(x=rnorm(9), y=rep(c("a","b","c"),each = 3)), z=rnorm(9))
		
		*subsetting column
		
	    DT[,list(mean(x),sum(x))]
		DT[,table(y)]
		
		DT[,W:=Z^2]   ADD NEW COLUMN
		
		*Careful, use copy() function to create new table
		
		*multiple operations
			DT[,m:={tmp<-(x+z);log2(tmp+5)}]
		
		*plyr like operation
		
			DT[,a:=x>0]
			DT[,b:=mean(x+w),by=a]
			
		*Special variables
		
			.N - An integer, length 1, containing the number r
			
			dt = data.table(x=sample(letters[1:3],1E5,TRUE))
			dt[,.N,by=x]  count how many times letter appear
			
		*Key (unique for data table)
		
			dt = data.table(x=rep(c("a","b","c"),each=100),y=rnorm(300))
			setkey(dt,x)  set key!!!!!
			dt['a']
			
		*Joins
		
			setkey(dt1, x); setkey(dt2,x)
			
			merge(dt1,dt2)   faster than merging data frame
			
		*Fast Reading
		
			big_def = data.frame(x=rnor(1E6),y=rnorm(1E6))
			file = tempfile()
			write.table(big_def,file=file,row.names = FALSE, col.names=TRUE,sep="\t",quote=FALSE)
			system.time(fread(file))   0.326s     fread is used to read data tables
			
			system.time(read.table(file,sep="\t"))  more slower 5.7s
			
			
			
		
		
	

       
  ##Quiz
  
      *which is fastest with using data.table  : The first one
      
          DT[,mean(pwgtp15),by=SEX]
          tapply(DT$pwgtp15,DT$SEX,mean)
          sapply(split(DT$pwgtp15,DT$SEX),mean)
          mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
