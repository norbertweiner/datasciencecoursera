#author: Zhang Zhang
#Description: 
  #1. Merges the training and the test sets to create one data set.
  #2. Extracts only the measurements on the mean and standard deviation for each measurement.
  #3. Uses descriptive activity names to name the activities in the data set
  #4. Appropriately labels the data set with descriptive variable names.
  #5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
library(RCurl)

#Checking and Download the Dataset
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("zipfile.zip")){
  download.file(fileUrl,"zipfile.zip",method = "curl")
  unzip("zipfile.zip")
}

#Reading different data into the memory 
test_data<-read.table("./UCI HAR Dataset/test/X_test.txt",header = FALSE)
test_y<-read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE,colClasses = "character")
test_sub<-read.table("./UCI HAR Dataset/test/subject_test.txt",header = FALSE)
train_data<-read.table("./UCI HAR Dataset/train/X_train.txt",header = FALSE)
train_y<-read.table("./UCI HAR Dataset/train/y_train.txt",header = FALSE,colClasses = "character")
train_sub<-read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE)
activity<-read.table("./UCI HAR Dataset/activity_labels.txt",header = FALSE)
feature<-read.table("./UCI HAR Dataset/features.txt")

#Add column names to these data set
names(test_data)<-feature$V2
names(train_data)<-feature$V2
names(test_y)<-"activity"
names(train_y)<-"activity"
names(test_sub)<-"subject_id"
names(train_sub)<-"subject_id"
names(activity)<-c("activity_id","activity")

#Find the mean and std from the column names of these data set
mean_std_test<-grepl("mean\\(\\)",names(test_data))|grepl("std\\(\\)",names(test_data))
mean_std_train<-grepl("mean\\(\\)",names(train_data))|grepl("std\\(\\)",names(train_data))

#Change the activity to factors
test_y$activity<-factor(test_y$activity,levels = activity$activity_id,labels = activity$activity)
train_y$activity<-factor(train_y$activity,levels = activity$activity_id,labels = activity$activity)

#Start to migrate all the data set
#In order to save memory, delete data set after retrieve useful dataset
test<-test_data[,mean_std_test]
rm(test_data)
train<-train_data[,mean_std_train]
rm(train_data)

#Combine test and train data, then combine the activity and subject_id to the data
test_xy<-cbind(test_sub,test_y,test)
train_xy<-cbind(train_sub,train_y,train)
data<-rbind(test_xy,train_xy)

#calculate the mean group by id and activity
tidy<-aggregate(.~subject_id + activity,data = data,FUN = mean)
tidy<-arrange(tidy,subject_id,activity)

#write the tidy data to the directory
write.csv(tidy,"tidy.csv",row.names = FALSE)
