## Coursera Getting and Cleaning Data.

  ## Downloading and unzipping dataset
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

	# Assigning column names:

	colnames(x_train) <- features[,2] 
	colnames(y_train) <-"activityId"
	colnames(Sub_Train) <- "subjectId"
		  
	colnames(x_test) <- features[,2] 
	colnames(y_test) <- "activityId"
	colnames(Sub_Test) <- "subjectId"
		  
	colnames(activityLabels) <- c('activityId','activityType')
	# Merging all data in one set:

	mrg_train <- cbind(y_train, Sub_Train, x_train)
	mrg_test <- cbind(y_test, Sub_Test, x_test)
	TidaySubSet <- rbind(mrg_train, mrg_test)
# Mean and standard deviation for the required measurement
# Reading column names:

	colNames <- colnames(TidaySubSet)
# Create vector for mean and standard deviation:

	mean_and_std <- (grepl("activityId" , colNames) | 
					 grepl("subjectId" , colNames) | 
					 grepl("mean.." , colNames) | 
					 grepl("std.." , colNames) 
					 )
# Making nessesary subset from FinalSubset:

	MeanAndStd <- TidaySubSet[ , mean_and_std == TRUE]
# Using descriptive names 
	setWithActivityNames <- merge(MeanAndStd, activityLabels, by='activityId',all.x=TRUE)
# Creating a second, independent tidy data set with the average of each variable/activity and subject:
# Making final tidy data set

TidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
TidySet <- TidySet[order(TidySet$subjectId, TidySet$activityId),]
# Writing final tidy data set in to a text file

write.table(TidySet, "./data/TidyDataSet.txt", row.name=FALSE)
