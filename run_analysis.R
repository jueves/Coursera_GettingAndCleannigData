#Load libraries and data
library(plyr)
library(dplyr)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
unzip("~/getdata_projectfiles_UCI HAR Dataset.zip")

test <- read.table("~/UCI HAR Dataset/test/X_test.txt")
train <- read.table("~/UCI HAR Dataset/train/X_train.txt")
features <- read.table("~/UCI HAR Dataset/features.txt")
ytest <- read.table("~/UCI HAR Dataset/test/y_test.txt")
ytrain <- read.table("~/UCI HAR Dataset/train/y_train.txt")
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt")
activity_labels <- read.table("~/UCI HAR Dataset/activity_labels.txt")


#Appropriately labels the data set with descriptive variable names.
names(test) <- features[,2]
names(train) <- features[,2]

#Uses descriptive activity names to name the activities in the data set.
ytest <- merge(ytest, activity_labels)
ytrain <- merge(ytrain, activity_labels)
test["activity"] <- ytest[,2]
train["activity"] <- ytrain[,2]

#Merges the training and the test sets to create one data set.
test["set"] <- rep("test", nrow(test))
train["set"] <-rep("train", nrow(train))
test["subject"] <- subject_test
train["subject"] <- subject_train
mydata <- merge(train, test, all=TRUE)

#Extracts only the measurements on the mean and standard deviation for each measurement.
mean_and_std <- select(mydata, contains("Mean"), contains("std"))

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
mydata2 <- aggregate(mean_and_std, by=list(subject = mydata$subject, activity = mydata$activity), mean)

#Export datasets to files
write.table(mydata,file="~/UCI HAR Dataset/TidyData_FULL.txt",row.names=TRUE,col.names=TRUE, sep=",")
write.table(mydata2,file="~/UCI HAR Dataset/Mean_and_std_grouped.txt",row.names=TRUE,col.names=TRUE, sep=",")
write.table(mean_and_std,file="~/UCI HAR Dataset/Mean_and_std.txt",row.names=TRUE,col.names=TRUE, sep=",")
