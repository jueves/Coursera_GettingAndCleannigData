#Load libraries and data
library(plyr)
library(dplyr)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
unzip("~/getdata_projectfiles_UCI HAR Dataset.zip")

test <- read.table("~/UCI HAR Dataset/test/X_test.txt")
train <- read.table("~/UCI HAR Dataset/train/X_train.txt")
features <- read.table("~/UCI HAR Dataset/features.txt")
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt")

#Uses descriptive activity names to name the activities in the data set.
features[,2] <- gsub("arCoeff..1","arCoeff()WALKING", features[,2])
features[,2] <- gsub("arCoeff..2","arCoeff()WALKING_UPSTAIRS", features[,2])
features[,2] <- gsub("arCoeff..3","arCoeff()WALKING_DOWNSTAIRS", features[,2])
features[,2] <- gsub("arCoeff..4","arCoeff()SITTING", features[,2])
features[,2] <- gsub("arCoeff..5","arCoeff()STANDING", features[,2])
features[,2] <- gsub("arCoeff..6","arCoeff()LYING", features[,2])

#Appropriately labels the data set with descriptive variable names.
names(test) <- features[,2]
names(train) <- features[,2]

#Merges the training and the test sets to create one data set.
test["subject"] <- subject_test
train["subject"] <- subject_train
mydata <- merge(train, test, all=TRUE)

#Extracts only the measurements on the mean and standard deviation for each measurement.

Mean <- sapply(mydata, mean)
Standard_Deviation <- sapply(mydata, sd)
summarized_dataframe <- data.frame(Mean, Standard_Deviation)

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
mydata2 <- aggregate(mydata, by=list(mydata$subject), FUN=mean)

#Export datasets to files
write.table(mydata,file="~/UCI HAR Dataset/TidyData_FULL.csv",row.names=TRUE,col.names=TRUE, sep=",")
write.table(mydata2,file="~/UCI HAR Dataset/TidyData_persubject.csv",row.names=TRUE,col.names=TRUE, sep=",")
write.table(summarized_dataframe,file="~/UCI HAR Dataset/SummarizedData.csv",row.names=TRUE,col.names=TRUE, sep=",")
