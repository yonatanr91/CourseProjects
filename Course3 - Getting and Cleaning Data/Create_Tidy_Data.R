#check if file exists, if not, download and unzip
if(!file.exists("UCI HAR Dataset")) {
        fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile="C:/Users/yrafael/Desktop/Data Science Course/Course Code/UCI HAR Dataset.zip")
        unzip("UCI HAR Dataset.zip")
}

#download data sets
XTest <- read.table("UCI HAR Dataset/test/X_test.txt")
YTest <- read.table("UCI HAR Dataset/test/Y_test.txt")
SubjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
XTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
YTrain <- read.table("UCI HAR Dataset/train/Y_train.txt") 
SubjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
Features <- read.table("UCI HAR Dataset/features.txt")
ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")

#combine similar data sets
XTestTrain <- rbind(XTest, XTrain)
YTestTrain <- rbind(YTest, YTrain) 
SubjectTestTrain <-rbind(SubjectTest, SubjectTrain)

#set column names
names(SubjectTestTrain) <- "Subject"
names(YTestTrain) <- "Activity"
names(XTestTrain) <- Features$V2

#Subset Means and Standard Deviations
MeanStd <- grep("-mean\\(\\)|-std\\(\\)", Features[, 2])
XTestTrainFiltered <- XTestTrain[, MeanStd]

#Replace activities with descriptive names
YTestTrain[,1] <- ActivityLabels[YTestTrain[,1],2]

#finish combining data sets
DraftData <- cbind(SubjectTestTrain, YTestTrain)
DataSet1 <- cbind(XTestTrainFiltered, DraftData)

#clean column names
names(DataSet1) <- gsub('Acc',"Acceleration", names(DataSet1))
names(DataSet1) <- gsub("Gyro", "Gyroscope", names(DataSet1))
names(DataSet1) <- gsub("Mag", "Magnitude", names(DataSet1))
names(DataSet1) <- gsub("BodyBody", "Body", names(DataSet1))
names(DataSet1) <- gsub("^t", "time", names(DataSet1))
names(DataSet1) <- gsub("^f", "frequency", names(DataSet1))

#create tidy data set
library(plyr)
TidyData <-aggregate(. ~Subject + Activity, DataSet1, mean)


