## Cleaning-Data-Course-Project
Getting and CleaningData Projec1. Downloading and unzipping dataset
			  if(!file.exists("./data")){dir.create("./data")}
			  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
			  download.file(fileUrl,destfile="./data/Dataset.zip")
			  
			  # Unzip dataSet to /data directory
			  unzip(zipfile="./data/Dataset.zip",exdir="./data")
  
## Merging the training and the test sets to create one data set:

	x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
	y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
	Sub_Train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

	x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
	y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
	Sub_Test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

	features <- read.table('./data/UCI HAR Dataset/features.txt')
	activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

## Assigning ActivityID's to Training Lables, For eg: "1" =WALKING
	colnames(x_train) <- features[,2] 
	colnames(y_train) <-"activityId"
	colnames(Sub_Train) <- "subjectId"

## Assigning 'train/subject_train.txt': These rows identifies the subject with the  activity for the sample. 
   Eg: Records from 1 to 30.
		  
	colnames(x_test) <- features[,2] 
	colnames(y_test) <- "activityId"
	colnames(Sub_Test) <- "subjectId"
		  
	colnames(activityLabels) <- c('activityId','activityType')
## Calculate the Mean and the Meadian and assign to the final subset

	colNames <- colnames(TidaySubSet)
	mean_and_std <- (grepl("activityId" , colNames) | 
					 grepl("subjectId" , colNames) | 
					 grepl("mean.." , colNames) | 
					 grepl("std.." , colNames) 
					 )
	MeanAndStd <- TidaySubSet[ , mean_and_std == TRUE]
	setWithActivityNames <- merge(MeanAndStd, activityLabels, by='activityId',all.x=TRUE)
	TidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
	TidySet <- TidySet[order(TidySet$subjectId, TidySet$activityId),]
##  Writing final tidy data set in to a text file
write.table(TidySet, "./data/TidyDataSet.txt", row.name=FALSE)
