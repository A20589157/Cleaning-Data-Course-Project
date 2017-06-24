CodeBook

This is a code book that describes the variables, the data, to clean up a data set.

Purpose
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

DataSet
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

File lists:
'train/X_train.txt': Training set.
'test/X_test.txt': Test set.
'train/y_train.txt': Training labels.
'test/y_test.txt': Test labels.
'activity_labels.txt': Links the class labels with their activity name.
'features.txt': List of all features.

Variables:
mean_and_std - Created this varible to get the required string for the mean calculation
MeanAndStd - Created a subset for the file tidy data subset
setWithActivityNames - To Merge Activitylds with Mean subset
TidySet - Final tidy data set used to generate the file
