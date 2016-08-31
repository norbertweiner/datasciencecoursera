
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
       
  ##Quiz
  
      *which is fastest with using data.table  : The first one
      
          DT[,mean(pwgtp15),by=SEX]
          tapply(DT$pwgtp15,DT$SEX,mean)
          sapply(split(DT$pwgtp15,DT$SEX),mean)
          mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
