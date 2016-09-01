rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
  #set directory and download the necessary data
  setwd("C:/Users/Zhang Zhang/datasciencespecialization")
  if(!file.exists("RProgrammingAssignment3.zip")){
    fileUrl<-"https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip"
    download.file(fileUrl,"RProgrammingAssignment3.zip")
    unzip("RProgrammingAssignment3.zip")
    
  }
  
  care_measure_data<-"outcome-of-care-measures.csv"
  hospital_data<-"hospital-data.csv"
  parameter2<-c("heart attack","heart failure","pneumonia")
  
  result <- read.csv(care_measure_data, colClasses = "character")
  
  parameter1<-unique(result$State)
  
  ##check parameters
  if(!(state %in% parameter1)){stop("invalid state")}
  if(!(outcome %in% parameter2)){stop("invalid outcome")}
  
  #assign the col number for certain rate
  if(outcome=="heart attack"){
    col<-11
  }else if(outcome=="heart failure"){
    col<-17
  }else{
    col<-23
  }
  #convert to numeric
  result[,col]<-as.numeric(result[,col])
  
  #sort state information
  result<-result[result$State==state,]
  sorted_result<-result[order(result[,col],result$Hospital.Name,na.last = NA),]
  
  if(num=="best"){
    sorted_result$Hospital.Name[1]
  }else if(num=="worst"){
    tail(sorted_result$Hospital.Name,n=1)
  }else{
    if(num>length(sorted_result$Hospital.Name)){
      NA
    }else{
      sorted_result$Hospital.Name[num]
    }
    
  }
}